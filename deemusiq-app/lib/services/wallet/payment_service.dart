import 'package:deemusiq/models/wallet/payment_method.dart';
import 'package:deemusiq/models/wallet/region_pricing.dart';
import 'package:deemusiq/models/wallet/token_pack.dart';
import 'package:deemusiq/services/wallet/wallet_api.dart';

enum PaymentStatus {
  /// Tokens credited immediately (demo top-up only).
  success,

  /// Real rail is wired but settlement happens off-app and needs the DeeMusiq
  /// backend (PayFast/Stripe redirect, or a crypto deposit watcher).
  requiresBackend,

  /// Crypto: we produced a deposit request; confirmation needs a chain watcher.
  awaitingDeposit,

  failed,
}

/// Instructions for an on-chain top-up. [address] is empty until the operator
/// configures real deposit wallets (see [PaymentGatewayConfig]).
class CryptoDepositInfo {
  final String asset;
  final String network;
  final String address;
  final String amountLabel;

  const CryptoDepositInfo({
    required this.asset,
    required this.network,
    required this.address,
    required this.amountLabel,
  });

  bool get isConfigured => address.isNotEmpty;
}

class PaymentResult {
  final PaymentStatus status;
  final String reference;
  final String message;

  /// Tokens to credit right now (non-zero only for demo success).
  final int creditedTokens;
  final CryptoDepositInfo? deposit;

  /// A hosted-checkout URL to open (set when a real backend returns a card
  /// redirect). When present, the UI offers an "Open checkout" action.
  final String? actionUrl;

  /// Whether the UI may offer a "Simulate success (demo)" shortcut. True only
  /// for the local/no-backend scaffold; false for real backend responses (so a
  /// user can't fake-credit a real wallet).
  final bool allowSimulate;

  const PaymentResult({
    required this.status,
    required this.reference,
    required this.message,
    this.creditedTokens = 0,
    this.deposit,
    this.actionUrl,
    this.allowSimulate = false,
  });
}

/// Operator-supplied endpoints / wallets. Everything here is blank by default;
/// fill these (ideally from the backend, not hard-coded) to go live.
abstract class PaymentGatewayConfig {
  /// Base URL of the DeeMusiq backend that owns the wallet, payments, account
  /// linking and download authorisation. Set this to your server, e.g.
  /// `http://196.21.0.10:8080` (raw IP is fine — traffic is encrypted at the
  /// app layer, see [secureChannelKey]) or `https://api.deemusiq.co.za`.
  /// Empty = no backend, so the app runs OFFLINE: online streaming + already
  /// downloaded songs only, and the wallet/payments/account screens are locked.
  ///
  /// Can be overridden at build time with `--dart-define=DEEMUSIQ_BACKEND_URL=...`.
  static const String backendBaseUrl =
      String.fromEnvironment("DEEMUSIQ_BACKEND_URL", defaultValue: "");

  /// Pre-shared 256-bit key (base64 of 32 random bytes) for the AES-256-GCM
  /// "secure channel" that encrypts every request/response body in transit —
  /// even over plain HTTP. MUST equal the backend's `SECURE_CHANNEL_KEY`.
  /// Generate with: `openssl rand -base64 32`. Empty = plaintext JSON.
  ///
  /// Override at build time with `--dart-define=DEEMUSIQ_CHANNEL_KEY=...`.
  static const String secureChannelKey =
      String.fromEnvironment("DEEMUSIQ_CHANNEL_KEY", defaultValue: "");

  /// DeeMusiq currently settles in South Africa only. When true the app prices
  /// and charges in ZAR and the backend rejects non-ZA checkouts. Mirrors the
  /// backend's `PAYMENTS_ZA_ONLY`.
  static const bool paymentsZaOnly = true;

  /// Receiving wallet addresses per crypto rail. Empty = not configured.
  static const Map<PaymentMethodKind, String> cryptoAddresses = {
    PaymentMethodKind.bitcoin: "",
    PaymentMethodKind.ethereum: "",
    PaymentMethodKind.monero: "",
    PaymentMethodKind.usdt: "",
  };

  static const Map<PaymentMethodKind, String> cryptoNetworks = {
    PaymentMethodKind.bitcoin: "Bitcoin mainnet",
    PaymentMethodKind.ethereum: "Ethereum (ERC-20)",
    PaymentMethodKind.monero: "Monero",
    PaymentMethodKind.usdt: "Tether (ERC-20 / TRC-20)",
  };
}

abstract class PaymentService {
  Future<PaymentResult> purchase({
    required TokenPack pack,
    required RegionTier region,
    required PaymentMethodKind method,
  });
}

/// Default implementation.
///
/// - `demoCredit` settles instantly so the wallet is fully usable offline.
/// - Fiat rails return [PaymentStatus.requiresBackend]: a real build POSTs to
///   [PaymentGatewayConfig.backendBaseUrl] to open a PayFast/Stripe checkout.
/// - Crypto rails return [PaymentStatus.awaitingDeposit] with a deposit request;
///   a backend chain-watcher credits the tokens once the deposit confirms.
///
/// No real money moves in this build — by design. The seams (backend URL,
/// wallet addresses) are the only things missing to go live.
class DeeMusiqPaymentService implements PaymentService {
  const DeeMusiqPaymentService();

  String _reference() =>
      "DM-${DateTime.now().millisecondsSinceEpoch.toRadixString(36).toUpperCase()}";

  @override
  Future<PaymentResult> purchase({
    required TokenPack pack,
    required RegionTier region,
    required PaymentMethodKind method,
  }) async {
    // DeeMusiq tokens are purchased ONLINE only — the backend is the single
    // source of truth for balances, so there is no local or "demo" crediting.
    if (PaymentGatewayConfig.backendBaseUrl.isEmpty) {
      return PaymentResult(
        status: PaymentStatus.requiresBackend,
        reference: _reference(),
        message:
            "Token top-ups are online only. Connect to the internet and DeeMusiq to buy tokens.",
      );
    }
    if (method == PaymentMethodKind.demoCredit) {
      return PaymentResult(
        status: PaymentStatus.failed,
        reference: _reference(),
        message:
            "Demo top-ups are off — DeeMusiq tokens are purchased securely online.",
      );
    }
    return _purchaseViaBackend(pack: pack, region: region, method: method);
  }

  /// Talks to the DeeMusiq backend `/payments/checkout`. Maps the server's
  /// response to a [PaymentResult]. No `allowSimulate` here — real settlement
  /// only happens through the provider + webhook.
  Future<PaymentResult> _purchaseViaBackend({
    required TokenPack pack,
    required RegionTier region,
    required PaymentMethodKind method,
  }) async {
    try {
      final res = await WalletApiClient.instance.createCheckout(
        packId: pack.id,
        method: method.name,
        region: region.code,
      );
      final reference = (res["intentId"] as String?) ?? _reference();

      switch (res["status"] as String?) {
        case "redirect":
          return PaymentResult(
            status: PaymentStatus.requiresBackend,
            reference: reference,
            message:
                "Open the secure ${method.label} checkout to pay. Tokens are added once payment confirms.",
            actionUrl: res["payUrl"] as String?,
          );
        case "crypto":
          final d = res["deposit"] as Map?;
          return PaymentResult(
            status: PaymentStatus.awaitingDeposit,
            reference: reference,
            message: "Send the exact amount below to confirm your top-up.",
            deposit: CryptoDepositInfo(
              asset: (d?["asset"] ?? method.label).toString(),
              network: (d?["network"] ?? method.label).toString(),
              address: (d?["address"] ?? "").toString(),
              amountLabel: (d?["amountLabel"] ?? "").toString(),
            ),
          );
        case "requires_config":
        case "unavailable":
          return PaymentResult(
            status: PaymentStatus.requiresBackend,
            reference: reference,
            message: (res["message"] ?? "Not available yet.").toString(),
          );
        default:
          return PaymentResult(
            status: PaymentStatus.failed,
            reference: reference,
            message: (res["message"] ?? "Checkout could not be started.")
                .toString(),
          );
      }
    } on WalletApiException catch (e) {
      return PaymentResult(
        status: PaymentStatus.failed,
        reference: _reference(),
        message: e.message,
      );
    }
  }
}

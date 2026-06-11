import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';

/// How a top-up settles. DeeMusiq supports card (fiat) rails and several
/// crypto rails, plus a local "demo" credit used for testing without a backend.
enum PaymentRail { fiat, crypto, demo }

/// Concrete payment methods a user can pick when buying tokens.
///
/// The fiat/crypto methods are wired through [PaymentService] but require the
/// DeeMusiq backend (PayFast/Stripe merchant + a crypto deposit watcher) to
/// actually settle. The [demoCredit] method credits instantly and exists so the
/// wallet is fully demoable offline.
enum PaymentMethodKind {
  payfastCard,
  stripeCard,
  monero,
  ethereum,
  bitcoin,
  usdt,
  walletBalance,
  demoCredit;

  PaymentRail get rail {
    switch (this) {
      case PaymentMethodKind.payfastCard:
      case PaymentMethodKind.stripeCard:
        return PaymentRail.fiat;
      case PaymentMethodKind.monero:
      case PaymentMethodKind.ethereum:
      case PaymentMethodKind.bitcoin:
      case PaymentMethodKind.usdt:
        return PaymentRail.crypto;
      case PaymentMethodKind.walletBalance:
      case PaymentMethodKind.demoCredit:
        return PaymentRail.demo;
    }
  }

  bool get isCrypto => rail == PaymentRail.crypto;

  String get label {
    switch (this) {
      case PaymentMethodKind.payfastCard:
        return "Card · PayFast";
      case PaymentMethodKind.stripeCard:
        return "Card · Stripe";
      case PaymentMethodKind.monero:
        return "Monero (XMR)";
      case PaymentMethodKind.ethereum:
        return "Ethereum (ETH)";
      case PaymentMethodKind.bitcoin:
        return "Bitcoin (BTC)";
      case PaymentMethodKind.usdt:
        return "Tether (USDT)";
      case PaymentMethodKind.walletBalance:
        return "Token balance";
      case PaymentMethodKind.demoCredit:
        return "Test top-up (demo)";
    }
  }

  /// Network / processor sub-label shown under the method name.
  String get subtitle {
    switch (this) {
      case PaymentMethodKind.payfastCard:
        return "Visa / Mastercard · ZAR settlement";
      case PaymentMethodKind.stripeCard:
        return "International cards";
      case PaymentMethodKind.monero:
        return "Private, low-fee · Monero network";
      case PaymentMethodKind.ethereum:
        return "ERC-20 · Ethereum mainnet";
      case PaymentMethodKind.bitcoin:
        return "On-chain BTC / Lightning";
      case PaymentMethodKind.usdt:
        return "Stablecoin · TRC-20 / ERC-20";
      case PaymentMethodKind.walletBalance:
        return "Spend tokens you already own";
      case PaymentMethodKind.demoCredit:
        return "Credits instantly — no real payment";
    }
  }

  IconData get icon {
    switch (this) {
      case PaymentMethodKind.payfastCard:
      case PaymentMethodKind.stripeCard:
        return DeeMusiqIcons.creditCard;
      case PaymentMethodKind.bitcoin:
        return DeeMusiqIcons.bitcoin;
      case PaymentMethodKind.ethereum:
        return DeeMusiqIcons.ethereum;
      case PaymentMethodKind.monero:
        return DeeMusiqIcons.monero;
      case PaymentMethodKind.usdt:
        return DeeMusiqIcons.tether;
      case PaymentMethodKind.walletBalance:
        return DeeMusiqIcons.token;
      case PaymentMethodKind.demoCredit:
        return DeeMusiqIcons.gift;
    }
  }

  /// Brand-ish accent for the method chip (brand fidelity via colour, since we
  /// deliberately avoid third-party brand icon packs to keep the build safe).
  Color get accent {
    switch (this) {
      case PaymentMethodKind.payfastCard:
        return const Color(0xFF2E7D32);
      case PaymentMethodKind.stripeCard:
        return const Color(0xFF635BFF);
      case PaymentMethodKind.bitcoin:
        return const Color(0xFFF7931A);
      case PaymentMethodKind.ethereum:
        return const Color(0xFF627EEA);
      case PaymentMethodKind.monero:
        return const Color(0xFFFF6600);
      case PaymentMethodKind.usdt:
        return const Color(0xFF26A17B);
      case PaymentMethodKind.walletBalance:
        return const Color(0xFFFF5722);
      case PaymentMethodKind.demoCredit:
        return const Color(0xFF9E9E9E);
    }
  }

  /// Methods offered on the token store (excludes spending existing balance).
  /// Online-only: tokens are bought through the backend, so the local
  /// [demoCredit] method is intentionally NOT offered here.
  static List<PaymentMethodKind> get topUpMethods => const [
        PaymentMethodKind.payfastCard,
        PaymentMethodKind.stripeCard,
        PaymentMethodKind.monero,
        PaymentMethodKind.ethereum,
        PaymentMethodKind.bitcoin,
        PaymentMethodKind.usdt,
      ];
}

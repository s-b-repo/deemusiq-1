import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deemusiq/models/wallet/region_pricing.dart';
import 'package:deemusiq/provider/user_preferences/user_preferences_provider.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/services/wallet/payment_service.dart'
    show PaymentGatewayConfig;

/// The pricing region currently in effect: an explicit wallet override if set,
/// otherwise derived from the app's recommendation market. DeeMusiq's base is
/// South Africa (ZAR), so unknown markets still fall back sensibly.
final regionTierProvider = Provider<RegionTier>((ref) {
  // Payments are South-Africa-only for now: lock pricing to ZAR so a user can't
  // pick a region the backend will reject. (Mirrors backend PAYMENTS_ZA_ONLY.)
  if (PaymentGatewayConfig.paymentsZaOnly) {
    return RegionTier.za;
  }

  final override = ref.watch(walletProvider.select((s) => s.regionCode));
  if (override != null) {
    return RegionTier.forCode(override);
  }

  final market = ref.watch(
    userPreferencesProvider.select((p) => p.market),
  );
  return RegionTier.forMarket(market);
});

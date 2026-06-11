import 'package:deemusiq/models/metadata/market.dart';

/// A region pricing tier. Token packs are authored in **ZAR** (DeeMusiq is
/// South-Africa first); each tier converts that base into a fair local price
/// using a purchasing-power factor and an approximate FX rate.
///
/// NOTE: [fxPerZar] and [pppFactor] are static, hand-set approximations so the
/// app can price offline. A production system would fetch live FX and resolve
/// final prices server-side (see DEEMUSIQ_WALLET.md). They are intentionally
/// easy to edit in one place.
class RegionTier {
  /// Stable key used for persistence / lookup (ISO-3166 alpha-2 or a region id).
  final String code;
  final String label;
  final String currencyCode;
  final String currencySymbol;

  /// Approximate units of the local currency per 1 ZAR.
  final double fxPerZar;

  /// Purchasing-power adjustment relative to the SA base (1.0 == SA).
  final double pppFactor;

  const RegionTier({
    required this.code,
    required this.label,
    required this.currencyCode,
    required this.currencySymbol,
    required this.fxPerZar,
    required this.pppFactor,
  });

  /// Local-currency price for a base ZAR amount.
  double localPrice(double baseZar) => baseZar * pppFactor * fxPerZar;

  /// Pretty-printed local price, e.g. "R29.00" or "$5.99".
  String formatPrice(double baseZar) {
    final value = localPrice(baseZar);
    // Currencies with negligible minor units read better without decimals.
    final noDecimals = currencyCode == "NGN" ||
        currencyCode == "KES" ||
        currencyCode == "INR";
    final amount =
        noDecimals ? value.round().toString() : value.toStringAsFixed(2);
    return "$currencySymbol$amount";
  }

  static const za = RegionTier(
    code: "ZA",
    label: "South Africa",
    currencyCode: "ZAR",
    currencySymbol: "R",
    fxPerZar: 1.0,
    pppFactor: 1.0,
  );

  static const global = RegionTier(
    code: "US",
    label: "Global (USD)",
    currencyCode: "USD",
    currencySymbol: "\$",
    fxPerZar: 0.054,
    pppFactor: 2.2,
  );

  static const uk = RegionTier(
    code: "GB",
    label: "United Kingdom",
    currencyCode: "GBP",
    currencySymbol: "£",
    fxPerZar: 0.043,
    pppFactor: 2.2,
  );

  static const euro = RegionTier(
    code: "EU",
    label: "Eurozone",
    currencyCode: "EUR",
    currencySymbol: "€",
    fxPerZar: 0.050,
    pppFactor: 2.0,
  );

  static const australia = RegionTier(
    code: "AU",
    label: "Australia",
    currencyCode: "AUD",
    currencySymbol: "A\$",
    fxPerZar: 0.083,
    pppFactor: 1.9,
  );

  static const canada = RegionTier(
    code: "CA",
    label: "Canada",
    currencyCode: "CAD",
    currencySymbol: "C\$",
    fxPerZar: 0.074,
    pppFactor: 1.9,
  );

  static const india = RegionTier(
    code: "IN",
    label: "India",
    currencyCode: "INR",
    currencySymbol: "₹",
    fxPerZar: 4.6,
    pppFactor: 0.55,
  );

  static const brazil = RegionTier(
    code: "BR",
    label: "Brazil",
    currencyCode: "BRL",
    currencySymbol: "R\$",
    fxPerZar: 0.30,
    pppFactor: 0.9,
  );

  static const nigeria = RegionTier(
    code: "NG",
    label: "Nigeria",
    currencyCode: "NGN",
    currencySymbol: "₦",
    fxPerZar: 86.0,
    pppFactor: 0.7,
  );

  static const kenya = RegionTier(
    code: "KE",
    label: "Kenya",
    currencyCode: "KES",
    currencySymbol: "KSh ",
    fxPerZar: 7.0,
    pppFactor: 0.7,
  );

  static const ghana = RegionTier(
    code: "GH",
    label: "Ghana",
    currencyCode: "GHS",
    currencySymbol: "GH₵",
    fxPerZar: 0.83,
    pppFactor: 0.7,
  );

  /// Every tier the user can manually pick from in the store.
  static const all = <RegionTier>[
    za,
    nigeria,
    kenya,
    ghana,
    global,
    uk,
    euro,
    australia,
    canada,
    india,
    brazil,
  ];

  static RegionTier forCode(String? code) {
    if (code == null) return za;
    return all.firstWhere(
      (t) => t.code == code,
      orElse: () => za,
    );
  }

  /// Maps the app's recommendation market to a pricing tier. Unmapped markets
  /// fall back to the global USD tier (DeeMusiq's SA base stays [za]).
  static RegionTier forMarket(Market market) {
    switch (market) {
      case Market.ZA:
        return za;
      case Market.NG:
        return nigeria;
      case Market.KE:
        return kenya;
      case Market.GH:
        return ghana;
      case Market.GB:
        return uk;
      case Market.AU:
        return australia;
      case Market.CA:
        return canada;
      case Market.IN:
        return india;
      case Market.BR:
        return brazil;
      case Market.DE:
      case Market.FR:
      case Market.ES:
      case Market.IT:
      case Market.NL:
      case Market.IE:
      case Market.PT:
      case Market.AT:
      case Market.BE:
      case Market.FI:
      case Market.GR:
        return euro;
      default:
        return global;
    }
  }
}

/// A purchasable bundle of DeeMusiq tokens. Prices are authored in ZAR and
/// localised per region by [RegionTier].
class TokenPack {
  final String id;
  final String label;
  final int tokens;
  final int bonusTokens;
  final double basePriceZar;
  final bool popular;

  const TokenPack({
    required this.id,
    required this.label,
    required this.tokens,
    required this.basePriceZar,
    this.bonusTokens = 0,
    this.popular = false,
  });

  int get totalTokens => tokens + bonusTokens;

  static const all = <TokenPack>[
    TokenPack(
      id: "starter",
      label: "Starter",
      tokens: 50,
      basePriceZar: 29,
    ),
    TokenPack(
      id: "popular",
      label: "Crowd Favourite",
      tokens: 120,
      bonusTokens: 10,
      basePriceZar: 59,
      popular: true,
    ),
    TokenPack(
      id: "pro",
      label: "Drop Day",
      tokens: 300,
      bonusTokens: 40,
      basePriceZar: 129,
    ),
    TokenPack(
      id: "mega",
      label: "Headliner",
      tokens: 700,
      bonusTokens: 120,
      basePriceZar: 249,
    ),
  ];
}

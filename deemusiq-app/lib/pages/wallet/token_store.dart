import 'package:auto_route/auto_route.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/titlebar/titlebar.dart';
import 'package:deemusiq/components/wallet/purchase_dialog.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/models/wallet/region_pricing.dart';
import 'package:deemusiq/models/wallet/token_pack.dart';
import 'package:deemusiq/provider/wallet/region_provider.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/services/wallet/payment_service.dart'
    show PaymentGatewayConfig;

@RoutePage()
class TokenStorePage extends HookConsumerWidget {
  static const name = "token-store";

  const TokenStorePage({super.key});

  Future<void> _pickRegion(BuildContext context, WidgetRef ref) async {
    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Choose your region").large(),
          content: SizedBox(
            width: 360,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Token packs are priced fairly per region (purchasing-power adjusted).",
                ).muted().small(),
                const Gap(12),
                ...RegionTier.all.map(
                  (tier) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Button.outline(
                      onPressed: () {
                        ref
                            .read(walletProvider.notifier)
                            .setRegionOverride(tier.code);
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          Expanded(child: Text(tier.label)),
                          Text(tier.currencyCode).muted().small(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Button.outline(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final region = ref.watch(regionTierProvider);
    final balance = ref.watch(walletProvider.select((s) => s.balance));

    return SafeArea(
      bottom: false,
      child: Scaffold(
        headers: [
          TitleBar(title: const Text("Token store")),
        ],
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 760),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Icon(DeeMusiqIcons.token,
                              color: deeMusiqOrange),
                          const Gap(10),
                          Expanded(
                            child: Text(
                              "Balance: ${formatTokens(balance)} tokens",
                            ).semiBold(),
                          ),
                          Button.ghost(
                            leading: const Icon(DeeMusiqIcons.region, size: 16),
                            onPressed: PaymentGatewayConfig.paymentsZaOnly
                                ? () => showWalletToast(
                                      context,
                                      "DeeMusiq top-ups are available in South Africa (ZAR) for now.",
                                      icon: DeeMusiqIcons.region,
                                    )
                                : () => _pickRegion(context, ref),
                            child: Text(region.currencyCode),
                          ),
                        ],
                      ),
                    ),
                    const Gap(8),
                    Text(
                      "Prices for ${region.label} · adjusted for your region.",
                    ).muted().small(),
                    const Gap(16),
                    for (final pack in TokenPack.all)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _PackCard(pack: pack, region: region),
                      ),
                    const Gap(12),
                    Card(
                      filled: true,
                      fillColor: context.theme.colorScheme.muted,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(DeeMusiqIcons.creditCard, size: 16),
                              const Gap(8),
                              const Text("Cards & crypto").semiBold(),
                            ],
                          ),
                          const Gap(6),
                          const Text(
                            "Pay with PayFast/Stripe cards or Monero, Ethereum, Bitcoin and USDT. "
                            "Top-ups are processed securely online by the DeeMusiq backend and are "
                            "available in South Africa for now — tokens appear once your payment confirms.",
                          ).muted().small(),
                        ],
                      ),
                    ),
                    const Gap(40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PackCard extends StatelessWidget {
  final TokenPack pack;
  final RegionTier region;
  const _PackCard({required this.pack, required this.region});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderColor: pack.popular ? deeMusiqOrange : null,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: deeMusiqOrange.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(DeeMusiqIcons.token,
                color: deeMusiqOrange, size: 26),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text("${formatTokens(pack.totalTokens)} tokens")
                        .semiBold(),
                    if (pack.popular) ...[
                      const Gap(8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: deeMusiqOrange,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Popular",
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 11),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  pack.bonusTokens > 0
                      ? "${pack.label} · ${pack.tokens} + ${pack.bonusTokens} bonus"
                      : pack.label,
                ).muted().xSmall(),
              ],
            ),
          ),
          const Gap(12),
          Button.primary(
            onPressed: () => showPurchaseTokensDialog(context, pack: pack),
            child: Text(region.formatPrice(pack.basePriceZar)),
          ),
        ],
      ),
    );
  }
}

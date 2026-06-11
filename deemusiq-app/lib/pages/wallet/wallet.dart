import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/routes.gr.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/titlebar/titlebar.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/models/wallet/token_transaction.dart';
import 'package:deemusiq/provider/wallet/region_provider.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';

@RoutePage()
class WalletPage extends HookConsumerWidget {
  static const name = "wallet";

  const WalletPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wallet = ref.watch(walletProvider);
    final region = ref.watch(regionTierProvider);

    // When a backend is configured, refresh authoritative state on open.
    // No-op (returns immediately) in the default local-only build.
    useEffect(() {
      ref.read(walletProvider.notifier).syncFromBackend();
      return null;
    }, const []);

    final recent = wallet.transactions.take(8).toList();

    return SafeArea(
      bottom: false,
      child: Scaffold(
        headers: [
          TitleBar(title: const Text("Wallet")),
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
                    _BalanceHero(
                      balance: wallet.balance,
                      regionLabel: region.label,
                    ),
                    const Gap(16),
                    _QuickActions(linkedCount: wallet.linkedAccounts.length),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(child: const Text("Recent activity").large()),
                        if (wallet.transactions.isNotEmpty)
                          Text(
                            "${wallet.totalPurchased} in · ${wallet.totalSpent} out",
                          ).muted().small(),
                      ],
                    ),
                    const Gap(8),
                    if (recent.isEmpty)
                      _EmptyActivity(
                        onBuy: () =>
                            context.navigateTo(const TokenStoreRoute()),
                      )
                    else
                      ...recent.map((tx) => Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: _ActivityTile(tx: tx),
                          )),
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

class _BalanceHero extends StatelessWidget {
  final int balance;
  final String regionLabel;
  const _BalanceHero({required this.balance, required this.regionLabel});

  static const _white = Color(0xFFFFFFFF);
  static const _deep = Color(0xFFE64A19);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFF7043), _deep],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(DeeMusiqIcons.token, color: _white, size: 18),
              Gap(8),
              Text("DeeMusiq tokens", style: TextStyle(color: _white)),
            ],
          ),
          const Gap(10),
          Text(
            formatTokens(balance),
            style: const TextStyle(
              color: _white,
              fontSize: 44,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            "Prices shown for $regionLabel · it's a drop day.",
            style: TextStyle(color: _white.withValues(alpha: 0.85)),
          ).small(),
          const Gap(16),
          Row(
            children: [
              Card(
                filled: true,
                fillColor: _white,
                borderColor: _white,
                padding: EdgeInsets.zero,
                child: Button.ghost(
                  onPressed: () =>
                      context.navigateTo(const TokenStoreRoute()),
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(DeeMusiqIcons.add, color: _deep, size: 16),
                        Gap(6),
                        Text(
                          "Buy tokens",
                          style: TextStyle(
                            color: _deep,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Button.ghost(
                onPressed: () =>
                    context.navigateTo(const PushLeaderboardRoute()),
                child: const Text("Trending", style: TextStyle(color: _white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  final int linkedCount;
  const _QuickActions({required this.linkedCount});

  @override
  Widget build(BuildContext context) {
    final actions = <(IconData, String, String, PageRouteInfo)>[
      (DeeMusiqIcons.shoppingBag, "Token store", "Buy regional packs",
          const TokenStoreRoute()),
      (
        DeeMusiqIcons.connect,
        "Linked accounts",
        linkedCount == 0 ? "Connect a service" : "$linkedCount connected",
        const LinkedAccountsRoute()
      ),
      (DeeMusiqIcons.shield, "Account & security", "Sign in, 2FA, recovery",
          const AccountRoute()),
      (DeeMusiqIcons.heart, "Creators you support", "See your impact",
          const CreatorsSupportedRoute()),
      (DeeMusiqIcons.trophy, "Trending pushes", "Most-pushed songs",
          const PushLeaderboardRoute()),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final (icon, title, subtitle, route) in actions)
          SizedBox(
            width: 224,
            child: Card(
              padding: EdgeInsets.zero,
              child: Button.ghost(
                onPressed: () => context.navigateTo(route),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: deeMusiqOrange.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(icon, color: deeMusiqOrange, size: 18),
                      ),
                      const Gap(12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(title).semiBold(),
                            Text(subtitle).muted().xSmall(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _ActivityTile extends StatelessWidget {
  final TokenTransaction tx;
  const _ActivityTile({required this.tx});

  IconData get _icon {
    switch (tx.type) {
      case TokenTransactionType.topUp:
        return DeeMusiqIcons.creditCard;
      case TokenTransactionType.push:
        return DeeMusiqIcons.boost;
      case TokenTransactionType.support:
        return DeeMusiqIcons.heart;
      case TokenTransactionType.bonus:
        return DeeMusiqIcons.gift;
      case TokenTransactionType.refund:
        return DeeMusiqIcons.refresh;
    }
  }

  @override
  Widget build(BuildContext context) {
    final credit = tx.tokens >= 0;
    final color = credit
        ? const Color(0xFF2E7D32)
        : context.theme.colorScheme.foreground;
    return Card(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          Icon(_icon, size: 18, color: deeMusiqOrange),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(tx.description).semiBold(),
                Text("${tx.type.label} · ${relativeTime(tx.timestamp)}")
                    .muted()
                    .xSmall(),
              ],
            ),
          ),
          const Gap(8),
          Text(
            "${credit ? "+" : ""}${formatTokens(tx.tokens)}",
            style: TextStyle(color: color, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class _EmptyActivity extends StatelessWidget {
  final VoidCallback onBuy;
  const _EmptyActivity({required this.onBuy});

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Icon(DeeMusiqIcons.token, size: 32, color: deeMusiqOrange),
          const Gap(10),
          const Text("No activity yet").semiBold(),
          const Gap(4),
          const Text(
            "Buy tokens, then push your favourite songs to support artists.",
            textAlign: TextAlign.center,
          ).muted().small(),
          const Gap(14),
          Button.primary(
            leading: const Icon(DeeMusiqIcons.add),
            onPressed: onBuy,
            child: const Text("Buy your first tokens"),
          ),
        ],
      ),
    );
  }
}

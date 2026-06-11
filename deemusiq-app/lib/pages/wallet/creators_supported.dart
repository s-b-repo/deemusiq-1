import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/image/universal_image.dart';
import 'package:deemusiq/components/titlebar/titlebar.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/models/wallet/supported_creator.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';

const _supportPresets = [5, 10, 25, 50];

@RoutePage()
class CreatorsSupportedPage extends HookConsumerWidget {
  static const name = "creators-supported";

  const CreatorsSupportedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final creators =
        ref.watch(walletProvider.select((s) => s.supportedCreators));
    final totalToCreators =
        creators.fold<int>(0, (sum, c) => sum + c.totalTokens);
    final topTokens = creators.isEmpty ? 1 : creators.first.totalTokens;

    return SafeArea(
      bottom: false,
      child: Scaffold(
        headers: [
          TitleBar(title: const Text("Creators you support")),
        ],
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Card(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          _stat("$totalToCreators", "tokens given"),
                          const Gap(24),
                          _stat("${creators.length}", "creators backed"),
                        ],
                      ),
                    ),
                    const Gap(16),
                    if (creators.isEmpty)
                      Card(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Icon(DeeMusiqIcons.heart,
                                size: 32, color: deeMusiqOrange),
                            const Gap(10),
                            const Text("No creators supported yet").semiBold(),
                            const Gap(4),
                            const Text(
                              "Push a song or support an artist directly — your tokens show up here.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    else
                      for (final creator in creators)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: _CreatorTile(
                            creator: creator,
                            share: creator.totalTokens / topTokens,
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

  Widget _stat(String value, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value).h3(),
        Text(label).muted().small(),
      ],
    );
  }
}

class _CreatorTile extends ConsumerWidget {
  final SupportedCreator creator;
  final double share;

  const _CreatorTile({required this.creator, required this.share});

  Future<void> _support(BuildContext context, WidgetRef ref) async {
    final tokens = await showDialog<int>(
      context: context,
      builder: (context) => _SupportDialog(creator: creator),
    );
    if (tokens == null) return;
    final ok = await ref.read(walletProvider.notifier).supportCreator(
          creatorId: creator.id,
          name: creator.name,
          imageUrl: creator.imageUrl,
          tokens: tokens,
        );
    if (context.mounted) {
      showWalletToast(
        context,
        ok
            ? "Sent $tokens tokens to ${creator.name}"
            : "Not enough tokens",
        icon: DeeMusiqIcons.heart,
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: creator.imageUrl != null
                    ? UniversalImage(
                        path: creator.imageUrl!,
                        width: 44,
                        height: 44,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 44,
                        height: 44,
                        color: deeMusiqOrange.withValues(alpha: 0.15),
                        child: const Icon(DeeMusiqIcons.artist,
                            color: deeMusiqOrange),
                      ),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(creator.name).semiBold(),
                    Text(
                      "${creator.contributions} contribution${creator.contributions == 1 ? "" : "s"} · ${relativeTime(creator.lastSupportedAt)}",
                    ).muted().xSmall(),
                  ],
                ),
              ),
              const Gap(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    formatTokens(creator.totalTokens),
                    style: const TextStyle(
                      color: deeMusiqOrange,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                  const Text("tokens").muted().xSmall(),
                ],
              ),
            ],
          ),
          const Gap(10),
          Container(
            height: 8,
            decoration: BoxDecoration(
              color: context.theme.colorScheme.muted,
              borderRadius: BorderRadius.circular(6),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: share.clamp(0.04, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  color: deeMusiqOrange,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ),
          ),
          const Gap(8),
          Align(
            alignment: Alignment.centerRight,
            child: Button.ghost(
              leading: const Icon(DeeMusiqIcons.heart, size: 14),
              onPressed: () => _support(context, ref),
              child: const Text("Support more"),
            ),
          ),
        ],
      ),
    );
  }
}

class _SupportDialog extends HookWidget {
  final SupportedCreator creator;
  const _SupportDialog({required this.creator});

  @override
  Widget build(BuildContext context) {
    final amount = useState(_supportPresets[1]);
    return AlertDialog(
      title: Text("Support ${creator.name}").large(),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Choose how many tokens to send.").muted().small(),
            const Gap(12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final p in _supportPresets)
                  Chip(
                    style: p == amount.value
                        ? ButtonVariance.primary
                        : ButtonVariance.outline,
                    onPressed: () => amount.value = p,
                    child: Text("$p"),
                  ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Button.outline(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        Button.primary(
          onPressed: () => Navigator.pop(context, amount.value),
          child: Text("Send ${amount.value}"),
        ),
      ],
    );
  }
}

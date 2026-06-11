import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/routes.gr.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';

Future<void> showPushSongDialog(
  BuildContext context, {
  required String songId,
  required String title,
  required String artist,
  String? artistId,
  String? imageUrl,
}) {
  return showDialog(
    context: context,
    builder: (context) => PushSongDialog(
      songId: songId,
      title: title,
      artist: artist,
      artistId: artistId,
      imageUrl: imageUrl,
    ),
  );
}

const _presets = [5, 10, 25, 50, 100];

class PushSongDialog extends HookConsumerWidget {
  final String songId;
  final String title;
  final String artist;
  final String? artistId;
  final String? imageUrl;

  const PushSongDialog({
    super.key,
    required this.songId,
    required this.title,
    required this.artist,
    this.artistId,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(walletProvider.select((s) => s.balance));
    final amount = useState(_presets[1]);
    final canAfford = balance >= amount.value;

    Future<void> push() async {
      final ok = await ref.read(walletProvider.notifier).pushSong(
            songId: songId,
            title: title,
            artist: artist,
            artistId: artistId,
            imageUrl: imageUrl,
            tokens: amount.value,
          );
      if (!context.mounted) return;
      if (ok) {
        showWalletToast(
          context,
          "Pushed \"$title\" with ${amount.value} tokens 🚀",
          icon: DeeMusiqIcons.boost,
        );
        Navigator.pop(context);
      } else {
        showWalletToast(context, "Not enough tokens for that push");
      }
    }

    return AlertDialog(
      title: Row(
        children: [
          const Icon(DeeMusiqIcons.boost, color: deeMusiqOrange),
          const Gap(8),
          Expanded(child: const Text("Push this song").large()),
        ],
      ),
      content: SizedBox(
        width: 420,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title).semiBold(),
            Text(artist).muted().small(),
            const Gap(16),
            Row(
              children: [
                const Icon(DeeMusiqIcons.token, color: deeMusiqOrange, size: 16),
                const Gap(6),
                Text("Balance: ${formatTokens(balance)} tokens").small(),
              ],
            ),
            const Gap(12),
            const Text("How many tokens?").muted().small(),
            const Gap(8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final p in _presets)
                  Chip(
                    style: p == amount.value
                        ? ButtonVariance.primary
                        : ButtonVariance.outline,
                    onPressed: () => amount.value = p,
                    child: Text("$p"),
                  ),
              ],
            ),
            const Gap(16),
            Card(
              filled: true,
              fillColor: context.theme.colorScheme.muted,
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  const Icon(DeeMusiqIcons.boost, size: 18),
                  const Gap(10),
                  Expanded(
                    child: Text(
                      "Pushing boosts this song on the DeeMusiq trending board and supports ${artist == "" ? "the artist" : artist}.",
                    ).muted().small(),
                  ),
                ],
              ),
            ),
            if (!canAfford) ...[
              const Gap(12),
              Text(
                "You need ${amount.value - balance} more tokens for this push.",
                style: TextStyle(
                  color: context.theme.colorScheme.destructive,
                ),
              ).small(),
            ],
          ],
        ),
      ),
      actions: [
        Button.outline(
          onPressed: () => Navigator.pop(context),
          child: const Text("Cancel"),
        ),
        if (!canAfford)
          Button.secondary(
            onPressed: () {
              Navigator.pop(context);
              context.navigateTo(const TokenStoreRoute());
            },
            child: const Text("Get tokens"),
          ),
        Button.primary(
          onPressed: canAfford ? push : null,
          child: Text("Push ${amount.value}"),
        ),
      ],
    );
  }
}

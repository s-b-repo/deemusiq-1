import 'package:auto_route/auto_route.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/titlebar/titlebar.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/models/wallet/linked_account.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';

@RoutePage()
class LinkedAccountsPage extends HookConsumerWidget {
  static const name = "linked-accounts";

  const LinkedAccountsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accounts = ref.watch(walletProvider.select((s) => s.linkedAccounts));
    final byProvider = {for (final a in accounts) a.provider: a};

    return SafeArea(
      bottom: false,
      child: Scaffold(
        headers: [
          TitleBar(title: const Text("Linked accounts")),
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
                      filled: true,
                      fillColor: context.theme.colorScheme.muted,
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        "Connect your accounts on other services to bring your "
                        "playlists and favourites into DeeMusiq. Real linking uses "
                        "each provider's secure login (OAuth) — add the provider's "
                        "client credentials to enable it.",
                      ).muted().small(),
                    ),
                    const Gap(16),
                    for (final provider in LinkedProvider.values)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: _ProviderTile(
                          provider: provider,
                          account: byProvider[provider],
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

class _ProviderTile extends ConsumerWidget {
  final LinkedProvider provider;
  final LinkedAccount? account;

  const _ProviderTile({required this.provider, this.account});

  Future<void> _connect(BuildContext context, WidgetRef ref) async {
    final handle = await showDialog<String>(
      context: context,
      builder: (context) => _ConnectDialog(provider: provider),
    );
    if (handle == null || handle.trim().isEmpty) return;
    await ref.read(walletProvider.notifier).linkAccount(
          provider,
          displayName: handle.trim(),
        );
    if (context.mounted) {
      showWalletToast(context, "${provider.label} connected",
          icon: DeeMusiqIcons.verified);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connected = account != null;
    return Card(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: provider.accent.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(provider.icon, color: provider.accent),
          ),
          const Gap(14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(provider.label).semiBold(),
                    if (connected) ...[
                      const Gap(6),
                      const Icon(DeeMusiqIcons.verified,
                          size: 14, color: Color(0xFF2E7D32)),
                    ],
                  ],
                ),
                Text(
                  connected
                      ? "Connected as ${account!.displayName}"
                      : provider.description,
                ).muted().xSmall(),
              ],
            ),
          ),
          const Gap(10),
          if (connected)
            Button.outline(
              onPressed: () =>
                  ref.read(walletProvider.notifier).unlinkAccount(provider),
              child: const Text("Disconnect"),
            )
          else
            Button.primary(
              onPressed: () => _connect(context, ref),
              child: const Text("Connect"),
            ),
        ],
      ),
    );
  }
}

class _ConnectDialog extends HookWidget {
  final LinkedProvider provider;
  const _ConnectDialog({required this.provider});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return AlertDialog(
      title: Text("Connect ${provider.label}").large(),
      content: SizedBox(
        width: 360,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "In a live build this opens ${provider.label}'s secure login. "
              "For now, enter the username/handle to show as connected.",
            ).muted().small(),
            const Gap(12),
            TextField(
              controller: controller,
              placeholder: Text("${provider.label} username"),
              onSubmitted: (value) => Navigator.pop(context, value),
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
          onPressed: () => Navigator.pop(context, controller.text),
          child: const Text("Connect"),
        ),
      ],
    );
  }
}

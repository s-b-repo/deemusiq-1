import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/models/wallet/payment_method.dart';
import 'package:deemusiq/models/wallet/token_pack.dart';
import 'package:deemusiq/provider/wallet/region_provider.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/services/wallet/payment_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

Future<void> showPurchaseTokensDialog(
  BuildContext context, {
  required TokenPack pack,
}) {
  return showDialog(
    context: context,
    builder: (context) => PurchaseTokensDialog(pack: pack),
  );
}

class PurchaseTokensDialog extends HookConsumerWidget {
  final TokenPack pack;
  const PurchaseTokensDialog({super.key, required this.pack});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final region = ref.watch(regionTierProvider);
    final method = useState(PaymentMethodKind.payfastCard);
    final loading = useState(false);
    final result = useState<PaymentResult?>(null);

    Future<void> applyAndClose(String toast) async {
      await ref.read(walletProvider.notifier).applyTopUp(
            pack: pack,
            method: method.value,
            region: region,
          );
      if (context.mounted) {
        showWalletToast(context, toast);
        Navigator.pop(context);
      }
    }

    Future<void> runPurchase() async {
      loading.value = true;
      final res = await const DeeMusiqPaymentService().purchase(
        pack: pack,
        region: region,
        method: method.value,
      );
      loading.value = false;
      if (res.status == PaymentStatus.success) {
        await applyAndClose("Added ${pack.totalTokens} tokens 🎉");
        return;
      }
      result.value = res;
    }

    final res = result.value;

    return AlertDialog(
      title: Row(
        children: [
          const Icon(DeeMusiqIcons.token, color: deeMusiqOrange),
          const Gap(8),
          Expanded(
            child: Text("Buy ${pack.totalTokens} tokens").large(),
          ),
        ],
      ),
      content: SizedBox(
        width: 440,
        child: SingleChildScrollView(
          child: res == null
              ? _MethodPicker(
                  pack: pack,
                  selected: method.value,
                  priceLabel: region.formatPrice(pack.basePriceZar),
                  onSelect: (m) => method.value = m,
                )
              : _ResultView(result: res),
        ),
      ),
      actions: res == null
          ? [
              Button.outline(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              Button.primary(
                onPressed: loading.value ? null : runPurchase,
                child: Text(loading.value ? "Processing…" : "Continue"),
              ),
            ]
          : res.status == PaymentStatus.failed
              ? [
                  Button.primary(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"),
                  ),
                ]
              : [
                  Button.outline(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Close"),
                  ),
                  if (res.actionUrl != null)
                    Button.primary(
                      onPressed: () {
                        launchUrlString(
                          res.actionUrl!,
                          mode: LaunchMode.externalApplication,
                        );
                        Navigator.pop(context);
                      },
                      child: const Text("Open checkout"),
                    )
                  else if (res.allowSimulate)
                    Button.primary(
                      onPressed: () =>
                          applyAndClose("Simulated payment — tokens added"),
                      child: const Text("Simulate success (demo)"),
                    ),
                ],
    );
  }
}

class _MethodPicker extends StatelessWidget {
  final TokenPack pack;
  final PaymentMethodKind selected;
  final String priceLabel;
  final ValueChanged<PaymentMethodKind> onSelect;

  const _MethodPicker({
    required this.pack,
    required this.selected,
    required this.priceLabel,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(priceLabel).h3(),
            const Gap(6),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                pack.bonusTokens > 0
                    ? "incl. ${pack.bonusTokens} bonus"
                    : pack.label,
              ).muted().small(),
            ),
          ],
        ),
        const Gap(4),
        const Text("Choose how to pay").muted().small(),
        const Gap(12),
        for (final m in PaymentMethodKind.topUpMethods)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: _MethodTile(
              method: m,
              selected: m == selected,
              onTap: () => onSelect(m),
            ),
          ),
      ],
    );
  }
}

class _MethodTile extends StatelessWidget {
  final PaymentMethodKind method;
  final bool selected;
  final VoidCallback onTap;

  const _MethodTile({
    required this.method,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      filled: selected,
      fillColor: selected ? method.accent.withValues(alpha: 0.10) : null,
      borderColor: selected ? method.accent : null,
      padding: EdgeInsets.zero,
      child: Button.ghost(
        onPressed: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: method.accent.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(method.icon, color: method.accent, size: 18),
              ),
              const Gap(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(method.label).semiBold(),
                    Text(method.subtitle).muted().xSmall(),
                  ],
                ),
              ),
              Icon(
                selected
                    ? DeeMusiqIcons.radioChecked
                    : DeeMusiqIcons.radioUnchecked,
                color: selected
                    ? method.accent
                    : context.theme.colorScheme.mutedForeground,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ResultView extends StatelessWidget {
  final PaymentResult result;
  const _ResultView({required this.result});

  @override
  Widget build(BuildContext context) {
    final deposit = result.deposit;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Icon(
              result.status == PaymentStatus.awaitingDeposit
                  ? DeeMusiqIcons.bitcoin
                  : DeeMusiqIcons.info,
              color: deeMusiqOrange,
            ),
            const Gap(8),
            Expanded(
              child: Text(
                result.status == PaymentStatus.awaitingDeposit
                    ? "Awaiting deposit"
                    : "Almost there",
              ).semiBold(),
            ),
          ],
        ),
        const Gap(10),
        Text(result.message),
        if (deposit != null) ...[
          const Gap(12),
          Card(
            filled: true,
            fillColor: context.theme.colorScheme.muted,
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("${deposit.asset} · ${deposit.network}").semiBold(),
                const Gap(4),
                Text("Amount: ${deposit.amountLabel}").muted().small(),
                const Gap(8),
                if (deposit.isConfigured)
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          deposit.address,
                          style: context.theme.typography.small.copyWith(
                            fontFamily: "monospace",
                          ),
                        ),
                      ),
                      IconButton.ghost(
                        icon: const Icon(DeeMusiqIcons.clipboard, size: 16),
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: deposit.address),
                          );
                          showWalletToast(context, "Address copied");
                        },
                      ),
                    ],
                  )
                else
                  const Text(
                    "No receiving wallet configured yet — set one in the backend / DEEMUSIQ_WALLET.md to accept this asset.",
                  ).muted().small(),
              ],
            ),
          ),
        ],
        const Gap(12),
        Text(
          "Reference ${result.reference} · no real charge was made in this build.",
        ).muted().xSmall(),
      ],
    );
  }
}

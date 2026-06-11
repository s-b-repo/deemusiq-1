import 'package:auto_route/auto_route.dart';
import 'package:flutter/services.dart' show Clipboard, ClipboardData, TextInputType;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:shadcn_flutter/shadcn_flutter_extension.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/titlebar/titlebar.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/services/wallet/wallet_api.dart';

/// Account & security: email/password sign-in, 2FA (TOTP) enrollment, recovery,
/// and security actions. Drives the `WalletApiClient` auth endpoints. All of it
/// requires a configured backend; with none, the API calls surface a clear error.
@RoutePage()
class AccountPage extends HookConsumerWidget {
  static const name = "account";
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        headers: [TitleBar(title: const Text("Account & security"))],
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          children: [
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 640),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _EmailPasswordCard(),
                    Gap(12),
                    _TotpCard(),
                    Gap(12),
                    _RecoveryCard(),
                    Gap(12),
                    _SecurityActionsCard(),
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

Future<void> _guard(
  BuildContext context,
  ValueNotifier<bool> loading,
  Future<void> Function() action,
  String successMessage,
) async {
  if (loading.value) return;
  loading.value = true;
  try {
    await action();
    if (context.mounted) showWalletToast(context, successMessage);
  } on WalletApiException catch (e) {
    if (context.mounted) {
      showWalletToast(context, e.message, icon: DeeMusiqIcons.error);
    }
  } catch (_) {
    if (context.mounted) {
      showWalletToast(context, "Something went wrong.", icon: DeeMusiqIcons.error);
    }
  } finally {
    loading.value = false;
  }
}

class _EmailPasswordCard extends HookConsumerWidget {
  const _EmailPasswordCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRegister = useState(true);
    final email = useTextEditingController();
    final password = useTextEditingController();
    final loading = useState(false);

    Future<void> submit() => _guard(context, loading, () async {
          if (isRegister.value) {
            await WalletApiClient.instance.registerEmail(
              email: email.text.trim(),
              password: password.text,
            );
          } else {
            await WalletApiClient.instance.loginEmail(
              email: email.text.trim(),
              password: password.text,
            );
          }
          await ref.read(walletProvider.notifier).syncFromBackend();
        }, isRegister.value
            ? "Account created — check your email to verify."
            : "Signed in.");

    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(DeeMusiqIcons.user, color: deeMusiqOrange),
              const Gap(8),
              Expanded(
                child: Text(isRegister.value
                        ? "Create an email account"
                        : "Sign in")
                    .semiBold(),
              ),
              Button.ghost(
                onPressed: () => isRegister.value = !isRegister.value,
                child: Text(isRegister.value ? "Have one? Sign in" : "Create"),
              ),
            ],
          ),
          const Gap(4),
          const Text(
            "An email + password lets you use this wallet on another device "
            "and recover it. Your password is never stored — only a hash.",
          ).muted().small(),
          const Gap(12),
          TextField(
            controller: email,
            placeholder: const Text("Email"),
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(8),
          TextField(
            controller: password,
            placeholder: const Text("Password (min 8 chars)"),
            obscureText: true,
          ),
          const Gap(12),
          Button.primary(
            onPressed: loading.value ? null : submit,
            child: Text(loading.value
                ? "Please wait…"
                : (isRegister.value ? "Create account" : "Sign in")),
          ),
        ],
      ),
    );
  }
}

class _TotpCard extends HookConsumerWidget {
  const _TotpCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setup = useState<Map<String, dynamic>?>(null);
    final code = useTextEditingController();
    final loading = useState(false);

    Future<void> startSetup() => _guard(context, loading, () async {
          setup.value = await WalletApiClient.instance.totpSetup();
        }, "Scan or enter the secret in your authenticator app.");

    Future<void> enable() => _guard(context, loading, () async {
          await WalletApiClient.instance.totpEnable(code.text.trim());
          setup.value = null;
          code.clear();
        }, "Two-factor authentication enabled.");

    final s = setup.value;
    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(DeeMusiqIcons.shield, color: deeMusiqOrange),
              const Gap(8),
              const Expanded(
                child: Text("Two-factor authentication (2FA)").semiBold(),
              ),
            ],
          ),
          const Gap(4),
          const Text(
            "Use any authenticator app (Google Authenticator, Authy, Aegis…). "
            "2FA also lets you recover your wallet on a new device.",
          ).muted().small(),
          const Gap(12),
          if (s == null)
            Button.outline(
              onPressed: loading.value ? null : startSetup,
              child: const Text("Set up 2FA"),
            )
          else ...[
            const Text("Add this secret to your authenticator app:")
                .muted()
                .small(),
            const Gap(6),
            Card(
              filled: true,
              fillColor: context.theme.colorScheme.muted,
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(child: Text("${s["secret"]}").small()),
                  IconButton.ghost(
                    icon: const Icon(DeeMusiqIcons.clipboard),
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: "${s["secret"]}"));
                      showWalletToast(context, "Secret copied.");
                    },
                  ),
                ],
              ),
            ),
            const Gap(10),
            TextField(
              controller: code,
              placeholder: const Text("6-digit code"),
              keyboardType: TextInputType.number,
            ),
            const Gap(10),
            Button.primary(
              onPressed: loading.value ? null : enable,
              child: const Text("Verify & enable"),
            ),
          ],
        ],
      ),
    );
  }
}

class _RecoveryCard extends HookConsumerWidget {
  const _RecoveryCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = useTextEditingController();
    final code = useTextEditingController();
    final loading = useState(false);

    Future<void> recover() => _guard(context, loading, () async {
          await WalletApiClient.instance.totpRecover(
            email: email.text.trim(),
            code: code.text.trim(),
          );
          await ref.read(walletProvider.notifier).syncFromBackend();
        }, "Recovered — welcome back.");

    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(DeeMusiqIcons.refresh, color: deeMusiqOrange),
              const Gap(8),
              const Expanded(
                child: Text("Recover with your authenticator").semiBold(),
              ),
            ],
          ),
          const Gap(4),
          const Text(
            "On a new device? Enter your account email and a current 2FA code "
            "to restore your wallet.",
          ).muted().small(),
          const Gap(12),
          TextField(
            controller: email,
            placeholder: const Text("Account email"),
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(8),
          TextField(
            controller: code,
            placeholder: const Text("6-digit code"),
            keyboardType: TextInputType.number,
          ),
          const Gap(12),
          Button.outline(
            onPressed: loading.value ? null : recover,
            child: const Text("Recover wallet"),
          ),
        ],
      ),
    );
  }
}

class _SecurityActionsCard extends HookConsumerWidget {
  const _SecurityActionsCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetEmail = useTextEditingController();
    final loading = useState(false);

    Future<void> resend() => _guard(context, loading,
        () => WalletApiClient.instance.requestVerify(),
        "If your email needs verifying, a link is on its way.");

    Future<void> reset() => _guard(context, loading,
        () => WalletApiClient.instance.forgotPassword(resetEmail.text.trim()),
        "If that email has an account, a reset link is on its way.");

    Future<void> logoutEverywhere() => _guard(context, loading,
        () => WalletApiClient.instance.logoutAll(),
        "Signed out on all devices.");

    Future<void> deleteAccount() async {
      final ok = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Delete account?").large(),
          content: const Text(
            "This permanently deletes your DeeMusiq account, wallet balance, "
            "history and linked accounts. This cannot be undone.",
          ).muted().small(),
          actions: [
            Button.outline(
              onPressed: () => Navigator.pop(context, false),
              child: const Text("Cancel"),
            ),
            Button.destructive(
              onPressed: () => Navigator.pop(context, true),
              child: const Text("Delete forever"),
            ),
          ],
        ),
      );
      if (ok != true) return;
      await _guard(context, loading, () async {
        await WalletApiClient.instance.deleteAccount();
        await ref.read(walletProvider.notifier).reset();
      }, "Account deleted.");
    }

    return Card(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Row(
            children: [
              Icon(DeeMusiqIcons.lock, color: deeMusiqOrange),
              Gap(8),
              Expanded(child: Text("Security").semiBold()),
            ],
          ),
          const Gap(12),
          Button.outline(
            onPressed: loading.value ? null : resend,
            child: const Text("Resend verification email"),
          ),
          const Gap(8),
          TextField(
            controller: resetEmail,
            placeholder: const Text("Email for password reset"),
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(8),
          Button.outline(
            onPressed: loading.value ? null : reset,
            child: const Text("Email me a password reset link"),
          ),
          const Gap(8),
          Button.outline(
            onPressed: loading.value ? null : logoutEverywhere,
            child: const Text("Log out on all devices"),
          ),
          const Gap(8),
          Button.destructive(
            onPressed: loading.value ? null : deleteAccount,
            child: const Text("Delete account"),
          ),
        ],
      ),
    );
  }
}

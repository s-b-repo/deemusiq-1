import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deemusiq/collections/routes.dart';
import 'package:deemusiq/collections/routes.gr.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/services/logger/logger.dart';

final appLinks = AppLinks();
final linkStream = appLinks.stringLinkStream.asBroadcastStream();

/// Handles `deemusiq://` deep links. The DeeMusiq backend redirects back into
/// the app via this scheme after the user completes a hosted-checkout payment
/// (`deemusiq://payments?status=...`) or links an account
/// (`deemusiq://link?provider=...`). In both cases we pull the authoritative
/// wallet state from the server and surface the relevant screen so the result
/// is reflected immediately.
///
/// The scheme is registered in `android/app/src/main/AndroidManifest.xml` and
/// matches the backend's `APP_DEEP_LINK`.
void useDeepLinking(WidgetRef ref, AppRouter router) {
  useEffect(() {
    final subscription = linkStream.listen((link) async {
      try {
        final uri = Uri.tryParse(link);
        if (uri == null || uri.scheme != "deemusiq") return;

        // Refresh from the backend (balance/transactions/supported creators).
        // Bounded so a hung backend can't block deep-link navigation.
        await ref
            .read(walletProvider.notifier)
            .syncFromBackend()
            .timeout(const Duration(seconds: 6), onTimeout: () {});

        switch (uri.host) {
          case "payments":
            await router.navigate(const WalletRoute());
            break;
          case "link":
            await router.navigate(const LinkedAccountsRoute());
            break;
          default:
            break;
        }
      } catch (e, stack) {
        AppLogger.reportError(e, stack);
      }
    });

    return subscription.cancel;
  }, const []);
}

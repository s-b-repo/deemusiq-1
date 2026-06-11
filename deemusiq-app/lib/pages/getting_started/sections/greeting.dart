import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:deemusiq/collections/assets.gen.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/extensions/context.dart';
import 'package:deemusiq/modules/getting_started/blur_card.dart';
import 'package:deemusiq/utils/platform.dart';

class GettingStartedPageGreetingSection extends HookConsumerWidget {
  final VoidCallback onNext;
  const GettingStartedPageGreetingSection({super.key, required this.onNext});

  @override
  Widget build(BuildContext context, ref) {
    return Center(
      child: BlurCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.branding.spotubeLogoPng.image(height: 200),
            const Gap(24),
            const Text("DeeMusiq").semiBold().h4(),
            const Gap(4),
            Text(
              kIsMobile
                  ? context.l10n.freedom_of_music_palm
                  : context.l10n.freedom_of_music,
              textAlign: TextAlign.center,
            ).light().large().italic(),
            const Gap(84),
            Button.primary(
              onPressed: onNext,
              trailing: const Icon(DeeMusiqIcons.angleRight),
              child: Text(context.l10n.get_started),
            ),
          ],
        ),
      ),
    );
  }
}

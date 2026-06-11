import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart' show ListTile;
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:deemusiq/collections/routes.gr.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/modules/settings/section_card_with_heading.dart';
import 'package:deemusiq/extensions/context.dart';

class SettingsDevelopersSection extends HookWidget {
  const SettingsDevelopersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionCardWithHeading(
      heading: context.l10n.developers,
      children: [
        ListTile(
          leading: const Icon(DeeMusiqIcons.logs),
          title: Text(context.l10n.logs),
          trailing: const Icon(DeeMusiqIcons.angleRight),
          onTap: () {
            context.navigateTo(const LogsRoute());
          },
        )
      ],
    );
  }
}

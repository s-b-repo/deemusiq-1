import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:deemusiq/collections/fake.dart';
import 'package:deemusiq/collections/deemusiq_icons.dart';
import 'package:deemusiq/components/image/universal_image.dart';
import 'package:deemusiq/components/titlebar/titlebar.dart';
import 'package:deemusiq/extensions/context.dart';
import 'package:deemusiq/models/metadata/metadata.dart';
import 'package:deemusiq/provider/metadata_plugin/core/user.dart';
import 'package:deemusiq/provider/wallet/wallet_provider.dart';
import 'package:deemusiq/components/wallet/wallet_common.dart';
import 'package:deemusiq/collections/routes.gr.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfilePage extends HookConsumerWidget {
  static const name = "profile";

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final me = ref.watch(metadataPluginUserProvider);
    final meData = me.asData?.value ?? FakeData.user;

    final walletBalance = ref.watch(walletProvider.select((s) => s.balance));
    final linkedCount =
        ref.watch(walletProvider.select((s) => s.linkedAccounts.length));

    // final userProperties = useMemoized(
    //   () => {
    //     context.l10n.email: meData.email ?? "N/A",
    //     context.l10n.profile_followers:
    //         meData.followers?.total.toString() ?? "N/A",
    //     context.l10n.birthday: meData.birthdate ?? context.l10n.not_born,
    //     context.l10n.country: markets
    //         .firstWhere((market) => market.$1 == meData.country)
    //         .$2,
    //     context.l10n.subscription: meData.product ?? context.l10n.hacker,
    //   },
    //   [meData],
    // );

    return SafeArea(
      child: Scaffold(
        headers: [
          TitleBar(
            title: Text(context.l10n.profile),
          )
        ],
        child: Skeletonizer(
          enabled: me.isLoading,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(600),
                      child: UniversalImage(
                        path: meData.images.asUrlString(
                          index: 1,
                          placeholder: ImagePlaceholder.artist,
                        ),
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              const SliverGap(10),
              SliverToBoxAdapter(
                child: Text(
                  meData.name,
                  textAlign: TextAlign.center,
                ).h4(),
              ),
              const SliverGap(20),
              SliverCrossAxisConstrained(
                maxCrossAxisExtent: 500,
                child: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Button.text(
                        leading: const Icon(DeeMusiqIcons.edit),
                        onPressed: () {
                          launchUrlString(
                            meData.externalUri,
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Text(context.l10n.edit),
                      ),
                    ],
                  ),
                ),
              ),
              // SliverCrossAxisConstrained(
              //   maxCrossAxisExtent: 500,
              //   child: SliverToBoxAdapter(
              //     child: Card(
              //       child: Padding(
              //         padding: const EdgeInsets.all(8.0),
              //         child: Table(
              //           columnWidths: const {
              //             0: FixedTableSize(120),
              //           },
              //           defaultRowHeight: const FixedTableSize(40),
              //           rows: [
              //             for (final MapEntry(:key, :value)
              //                 in userProperties.entries)
              //               TableRow(
              //                 cells: [
              //                   TableCell(
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(6),
              //                       child: Text(key).large(),
              //                     ),
              //                   ),
              //                   TableCell(
              //                     child: Padding(
              //                       padding: const EdgeInsets.all(6),
              //                       child: Text(value),
              //                     ),
              //                   ),
              //                 ],
              //               )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SliverCrossAxisConstrained(
                maxCrossAxisExtent: 500,
                child: SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8, vertical: 8),
                    child: Column(
                      children: [
                        _ProfileNavCard(
                          icon: DeeMusiqIcons.wallet,
                          title: "Wallet",
                          subtitle: "${formatTokens(walletBalance)} tokens",
                          onPressed: () =>
                              context.navigateTo(const WalletRoute()),
                        ),
                        const Gap(8),
                        _ProfileNavCard(
                          icon: DeeMusiqIcons.connect,
                          title: "Linked accounts",
                          subtitle: linkedCount == 0
                              ? "Connect Spotify and more"
                              : "$linkedCount connected",
                          onPressed: () => context
                              .navigateTo(const LinkedAccountsRoute()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SliverGap(200),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileNavCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onPressed;

  const _ProfileNavCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      padding: EdgeInsets.zero,
      child: Button.ghost(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              Icon(icon, color: deeMusiqOrange),
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
              const Icon(DeeMusiqIcons.angleRight, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

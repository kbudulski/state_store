import 'package:analytics_service/analytics_service.dart';
import 'package:bloc_app/features/settings/about/cubit/about_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/url_launcher.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

final Uri _termsUri = Uri.parse('https://flutter.dev');
final Uri _policyUri = Uri.parse('https://flutter.dev');

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit(
        remoteConfigService: context.read(),
      )..initialize(),
      child: const AboutView(),
    );
  }
}

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size16).copyWith(
          top: Dimens.size20,
        ),
        child: BlocBuilder<AboutCubit, AboutState>(
          builder: (_, state) {
            if (state.isLoading) {
              return const AppSpinner();
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  AppTileGroup(
                    cards: [
                      AppListTile(
                        icon: Icons.numbers,
                        trailing: const SizedBox.shrink(),
                        title: 'v${state.appVersion}',
                        iconBackgroundColor: Colors.cyan,
                      ),
                      AppListTile(
                        icon: Icons.info,
                        trailing: const Icon(Icons.arrow_outward),
                        title: 'Terms & conditions',
                        iconBackgroundColor: Colors.cyan,
                        onTap: () => launchUrl(_termsUri),
                      ),
                      AppListTile(
                        icon: Icons.info,
                        trailing: const Icon(Icons.arrow_outward),
                        title: 'Privacy policy',
                        iconBackgroundColor: Colors.cyan,
                        onTap: () => launchUrl(_policyUri),
                      ),
                    ],
                  ),
                  AppSpaces.gap20,
                  AppTileGroup(
                    cards: [
                      AppListTile(
                        icon: Icons.star,
                        title: _getPremiumDisplayStatus(state),
                        trailing: const SizedBox.shrink(),
                        subtitle: 'Premium',
                        iconBackgroundColor: Colors.cyan,
                      ),
                      AppSizedImage(
                        photo: state.photo ?? '',
                        height: 200,
                      ),
                    ],
                  ),
                  AppSpaces.gap20,
                  AppTileGroup(
                    cards: [
                      AppListTile(
                        icon: Icons.pie_chart,
                        title: _getSideText(state),
                        tileColor: _getSideColor(state),
                        trailing: const SizedBox.shrink(),
                        subtitle: 'Tap to join the forces!',
                        iconBackgroundColor: Colors.transparent,
                        onTap: () {
                          context
                              .read<AnalyticsService>()
                              .logSideTapEvent(side: _getSideText(state));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  MaterialColor _getSideColor(AboutState state) =>
      state.isLightSide ? Colors.lightBlue : Colors.red;

  String _getSideText(AboutState state) =>
      state.isLightSide ? 'Light side' : 'Dark side';

  String _getPremiumDisplayStatus(AboutState state) =>
      state.premium == true ? 'Activated' : 'Not activated';
}

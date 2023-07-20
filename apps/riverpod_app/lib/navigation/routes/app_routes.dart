import 'package:flutter/material.dart';
import 'package:riverpod_app/app/app.dart';
import 'package:riverpod_app/app/app_scaffold.dart';
import 'package:riverpod_app/features/api/api_page.dart';
import 'package:riverpod_app/navigation/routes/settings_route.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:utils/utils.dart';

// ignore_for_file: avoid_positional_boolean_parameters
List<VRouteElement> buildAppRoutes(bool isSignedIn) {
  return [
    VWidget(path: Paths.splash, widget: const SplashPage()),
    VWidget(
      path: Paths.login,
      widget: LoginPage(
        name: 'RIVERPOD',
        onSignedIn: () {
          rootNavigatorKey.currentContext?.vRouter.to(Paths.home);
        },
      ),
    ),
    VGuard(
      beforeEnter: (vRedirector) async {
        if (isSignedIn) return;
        return vRedirector.to(Paths.login);
      },
      stackedRoutes: [
        VNester(
          path: null,
          widgetBuilder: AppScaffold.new,
          nestedRoutes: [
            VWidget(
              key: const ValueKey(Paths.home),
              path: Paths.home,
              widget: const HomePage(),
              aliases: const [
                Paths.settings,
                Paths.api,
                Paths.apiDetails,
                Paths.gallery,
                Paths.addImage,
                Paths.profile,
                Paths.theme,
                Paths.notifications,
                Paths.help,
                Paths.about,
                Paths.helpFromHome,
              ],
            ),
            VWidget(
              key: const ValueKey(Paths.features),
              path: Paths.features,
              // widget: const FeaturesPage(),
              widget: const Placeholder(),
              aliases: const [
                Paths.profileFromFeatures,
                Paths.themeFromFeatures,
                Paths.notificationsFromFeatures,
              ],
            ),
          ],
          stackedRoutes: [
            VPopHandler(
              onPop: (vRedirector) async => vRedirector.to(Paths.home),
              onSystemPop: (vRedirector) async => vRedirector.to(Paths.home),
              stackedRoutes: [
                SettingsRoute(),
                VWidget(
                  path: Paths.helpFromHome,
                  // widget: const HelpPage(),
                  widget: const Placeholder(),
                ),
                VWidget(
                  path: Paths.api,
                  widget: const ApiPage(),
                  stackedRoutes: [
                    VWidget(
                      path: Paths.apiDetails,
                      // widget: const ApiDetailsPage(),
                      widget: const Placeholder(),
                      buildTransition: slideTransition,
                    ),
                  ],
                ),
                VWidget(
                  path: Paths.gallery,
                  // widget: const GalleryPage(),
                  widget: const Placeholder(),
                  stackedRoutes: [
                    VWidget(
                      path: Paths.addImage,
                      // widget: const AddImagePage(),
                      widget: const Placeholder(),
                    ),
                  ],
                ),
              ],
            ),
            VPopHandler(
              onPop: (vRedirector) async => vRedirector.to(Paths.features),
              onSystemPop: (vRedirector) async =>
                  vRedirector.to(Paths.features),
              stackedRoutes: [
                VWidget(
                  path: Paths.profileFromFeatures,
                  // widget: const ProfilePage(),
                  widget: const Placeholder(),
                ),
                VWidget(
                  path: Paths.themeFromFeatures,
                  // widget: const ThemePage(),
                  widget: const Placeholder(),
                ),
                VWidget(
                  path: Paths.notificationsFromFeatures,
                  // widget: const NotificationsPage(),
                  widget: const Placeholder(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}

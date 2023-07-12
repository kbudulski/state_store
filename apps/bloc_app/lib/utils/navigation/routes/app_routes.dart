import 'package:bloc_app/app/app.dart';
import 'package:bloc_app/app/app_scaffold.dart';
import 'package:bloc_app/features/add_image/add_image_page.dart';
import 'package:bloc_app/features/api/api_page.dart';
import 'package:bloc_app/features/api_details/api_details_page.dart';
import 'package:bloc_app/features/features/features_page.dart';
import 'package:bloc_app/features/gallery/gallery_page.dart';
import 'package:bloc_app/features/global/auth/auth_cubit.dart';
import 'package:bloc_app/features/home/home_page.dart';
import 'package:bloc_app/features/settings/help/help_page.dart';
import 'package:bloc_app/features/settings/notifications/notifications_page.dart';
import 'package:bloc_app/features/settings/profile/profile_page.dart';
import 'package:bloc_app/features/settings/theme/theme_page.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:bloc_app/utils/navigation/routes/settings_route.dart';
import 'package:bloc_app/utils/navigation/transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';

List<VRouteElement> buildAppRoutes(BuildContext context) {
  return [
    VWidget(path: Paths.splash, widget: const SplashPage()),
    VWidget(
      path: Paths.login,
      widget: LoginPage(
        name: 'BLOC',
        onSignedIn: () {
          rootNavigatorKey.currentContext?.vRouter.to(Paths.home);
        },
      ),
    ),
    VGuard(
      beforeEnter: (vRedirector) async {
        if (context.read<AuthCubit>().isSignedIn) {
          return;
        } else {
          return vRedirector.to(Paths.login);
        }
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
              widget: const FeaturesPage(),
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
                  widget: const HelpPage(),
                ),
                VWidget(
                  path: Paths.api,
                  widget: const ApiPage(),
                  stackedRoutes: [
                    VWidget(
                      path: Paths.apiDetails,
                      widget: const ApiDetailsPage(),
                      buildTransition: slideTransition,
                    ),
                  ],
                ),
                VWidget(
                  path: Paths.gallery,
                  widget: const GalleryPage(),
                  stackedRoutes: [
                    VWidget(
                      path: Paths.addImage,
                      widget: const AddImagePage(),
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
                  widget: const ProfilePage(),
                ),
                VWidget(
                  path: Paths.themeFromFeatures,
                  widget: const ThemePage(),
                ),
                VWidget(
                  path: Paths.notificationsFromFeatures,
                  widget: const NotificationsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ];
}

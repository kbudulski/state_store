import 'package:bloc_app/app/app.dart';
import 'package:bloc_app/app/app_scaffold.dart';
import 'package:bloc_app/features/global/auth/auth_cubit.dart';
import 'package:bloc_app/features/home/home_page.dart';
import 'package:bloc_app/features/user/user_page.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:bloc_app/utils/navigation/routes/settings_route.dart';
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
              path: Paths.home,
              widget: const HomePage(),
            ),
            VWidget(
              path: Paths.user,
              widget: const UserPage(),
              aliases: const [
                Paths.settings,
                Paths.profile,
                Paths.theme,
                Paths.notifications,
                Paths.help,
                Paths.about,
              ],
            ),
          ],
          stackedRoutes: [
            VPopHandler(
              onPop: (vRedirector) async => vRedirector.to(Paths.user),
              onSystemPop: (vRedirector) async => vRedirector.to(Paths.user),
              stackedRoutes: [
                SettingsRoute(),
              ],
            ),
            // SettingsRoute(),
          ],
        ),
      ],
    ),
  ];
}

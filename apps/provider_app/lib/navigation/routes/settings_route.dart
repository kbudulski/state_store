import 'package:flutter/cupertino.dart';
import 'package:provider_app/features/settings/settings_page.dart';
import 'package:provider_app/features/settings/theme/theme_page.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:utils/utils.dart';

class SettingsRoute extends VRouteElementBuilder {
  @override
  List<VRouteElement> buildRoutes() => [
        VWidget(
          path: Paths.settings,
          widget: const SettingsPage(),
          stackedRoutes: [
            VWidget(
              path: Paths.profile,
              // widget: const ProfilePage(),
              widget: const Placeholder(),
            ),
            VWidget(
              path: Paths.theme,
              widget: const ThemePage(),
            ),
            VWidget(
              path: Paths.notifications,
              // widget: const NotificationsPage(),
              widget: const Placeholder(),
            ),
            VWidget(
              path: Paths.help,
              // widget: const HelpPage(),
              widget: const Placeholder(),
            ),
            VWidget(
              path: Paths.about,
              // widget: const AboutPage(),
              widget: const Placeholder(),
            ),
          ],
        ),
      ];
}

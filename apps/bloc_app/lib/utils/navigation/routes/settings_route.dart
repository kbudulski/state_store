import 'package:bloc_app/features/settings/about/about_page.dart';
import 'package:bloc_app/features/settings/help/help_page.dart';
import 'package:bloc_app/features/settings/notifications/notifications_page.dart';
import 'package:bloc_app/features/settings/profile/profile_page.dart';
import 'package:bloc_app/features/settings/settings_page.dart';
import 'package:bloc_app/features/settings/theme/theme_page.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:shared_dependencies/vrouter.dart';

class SettingsRoute extends VRouteElementBuilder {
  @override
  List<VRouteElement> buildRoutes() => [
        VWidget(
          path: Paths.settings,
          widget: const SettingsPage(),
          stackedRoutes: [
            VWidget(
              path: Paths.profile,
              widget: const ProfilePage(),
            ),
            VWidget(
              path: Paths.theme,
              widget: const ThemePage(),
            ),
            VWidget(
              path: Paths.notifications,
              widget: const NotificationsPage(),
            ),
            VWidget(
              path: Paths.help,
              widget: const HelpPage(),
            ),
            VWidget(
              path: Paths.about,
              widget: const AboutPage(),
            ),
          ],
        ),
      ];
}

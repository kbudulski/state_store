import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/providers/auth/auth_provider.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:shared_dependencies/permission_handler.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            collapsedHeight: kToolbarHeight + 50,
            expandedHeight: kToolbarHeight + 100,
            centerTitle: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              titlePadding: const EdgeInsetsDirectional.only(bottom: 50),
              centerTitle: true,
              title: Text(
                'Settings',
                style: context.textTheme.headlineMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Dimens.size16).copyWith(
                top: Dimens.size20,
              ),
              child: Column(
                children: [
                  _buildPersonalGroup(context),
                  AppSpaces.gap20,
                  _buildConfigGroup(context),
                  AppSpaces.gap20,
                  _buildInfoGroup(context),
                  AppSpaces.gap20,
                  _buildLogoutButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppTileGroup _buildPersonalGroup(BuildContext context) {
    return AppTileGroup(
      cards: [
        AppListTile(
          icon: Icons.person,
          title: 'Profile',
          subtitle: 'Change your name and photo',
          iconBackgroundColor: Colors.lightGreen,
          onTap: () => context.vRouter.to(Paths.profile),
        ),
        AppListTile(
          icon: Icons.palette,
          title: 'Theme',
          subtitle: 'Change how the app looks',
          iconBackgroundColor: Colors.pinkAccent,
          onTap: () => context.vRouter.to(Paths.theme),
        ),
      ],
    );
  }

  AppTileGroup _buildConfigGroup(BuildContext context) {
    return AppTileGroup(
      cards: [
        const AppListTile(
          icon: Icons.lock,
          trailing: Icon(Icons.arrow_outward),
          title: 'Allow access',
          subtitle: 'Manage app permissions',
          iconBackgroundColor: Colors.grey,
          onTap: openAppSettings,
        ),
        AppListTile(
          icon: Icons.notifications_active,
          title: 'Notifications',
          subtitle: 'Toggle notification settings',
          iconBackgroundColor: Colors.cyan,
          onTap: () => context.vRouter.to(Paths.notifications),
        ),
      ],
    );
  }

  AppTileGroup _buildInfoGroup(BuildContext context) {
    return AppTileGroup(
      cards: [
        AppListTile(
          icon: Icons.chat_bubble,
          title: 'Help',
          subtitle: 'Get help and send feedback',
          iconBackgroundColor: Colors.amber,
          onTap: () => context.vRouter.to(Paths.help),
        ),
        AppListTile(
          icon: Icons.info,
          title: 'About',
          subtitle: 'Get information about the app',
          iconBackgroundColor: Colors.indigoAccent,
          onTap: () => context.vRouter.to(Paths.about),
        ),
      ],
    );
  }

  AppListTile _buildLogoutButton(BuildContext context) {
    return AppListTile(
      icon: Icons.logout,
      title: 'Logout',
      subtitle: 'Logout from the app',
      iconBackgroundColor: Colors.redAccent,
      onTap: () async {
        await context.read<AuthProvider>().signOut().then(
              (_) => context.vRouter.to(Paths.login),
            );
      },
      trailing: const SizedBox.shrink(),
    );
  }
}

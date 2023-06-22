import 'package:bloc_app/features/global/auth/auth_cubit.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:shared_dependencies/permission_handler.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

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

  CardGroup _buildPersonalGroup(BuildContext context) {
    return CardGroup(
      cards: [
        SimpleCard(
          icon: Icons.person,
          title: 'Profile',
          subtitle: 'Change your name and photo',
          iconBackgroundColor: Colors.lightGreen,
          onTap: () => context.vRouter.to(Paths.profile),
        ),
        SimpleCard(
          icon: Icons.palette,
          title: 'Theme',
          subtitle: 'Change how the app looks',
          iconBackgroundColor: Colors.pinkAccent,
          onTap: () => context.vRouter.to(Paths.theme),
        ),
      ],
    );
  }

  CardGroup _buildConfigGroup(BuildContext context) {
    return CardGroup(
      cards: [
        const SimpleCard(
          icon: Icons.lock,
          trailing: Icon(Icons.arrow_outward),
          title: 'Allow access',
          subtitle: 'Manage app permissions',
          iconBackgroundColor: Colors.grey,
          onTap: openAppSettings,
        ),
        SimpleCard(
          icon: Icons.notifications_active,
          title: 'Notifications',
          subtitle: 'Toggle notification settings',
          iconBackgroundColor: Colors.cyan,
          onTap: () => context.vRouter.to(Paths.notifications),
        ),
      ],
    );
  }

  CardGroup _buildInfoGroup(BuildContext context) {
    return CardGroup(
      cards: [
        SimpleCard(
          icon: Icons.chat_bubble,
          title: 'Help',
          subtitle: 'Get help and send feedback',
          iconBackgroundColor: Colors.amber,
          onTap: () => context.vRouter.to(Paths.help),
        ),
        SimpleCard(
          icon: Icons.info,
          title: 'About',
          subtitle: 'Get information about the app',
          iconBackgroundColor: Colors.indigoAccent,
          onTap: () => context.vRouter.to(Paths.about),
        ),
      ],
    );
  }

  SimpleCard _buildLogoutButton(BuildContext context) {
    return SimpleCard(
      icon: Icons.logout,
      title: 'Logout',
      subtitle: 'Logout from the app',
      iconBackgroundColor: Colors.redAccent,
      onTap: () async {
        await context.read<AuthCubit>().signOut().then(
              (_) => context.vRouter.to(Paths.login),
            );
      },
      trailing: const SizedBox.shrink(),
    );
  }
}

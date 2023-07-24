import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/features/settings/notifications/provider/notifications_provider.dart';
import 'package:provider_app/providers/user_data/user_data_provider.dart';
import 'package:shared_dependencies/app_settings.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size16).copyWith(
          top: Dimens.size20,
        ),
        child: AppTileGroup(
          cards: [
            StateNotifierBuilder(
              stateNotifier: context.watch<NotificationsProvider>(),
              builder: (context, state, child) => AppListTile(
                icon: Icons.lock_open,
                title: state.status.name.capitalize,
                subtitle: 'Permissions status',
                iconBackgroundColor: Colors.cyan,
                trailing: _buildPermissionRefreshButton(context, state),
              ),
            ),
            Builder(
              builder: (context) => AppSwitchCard(
                icon: Icons.access_time,
                title: 'Daily',
                subtitle: 'Subscribe to daily messages',
                value: context.watch<UserDataProvider>().subscribedToDaily,
                onChanged: (value) {
                  context
                      .read<NotificationsProvider>()
                      .toggleDaily(subscribed: value);
                  context.read<UserDataProvider>().saveDailySubscription();
                },
              ),
            ),
            const AppListTile(
              icon: Icons.settings,
              trailing: Icon(Icons.arrow_outward),
              title: 'Primary settings',
              subtitle: 'Change sound, vibrations, priority',
              iconBackgroundColor: Colors.cyan,
              onTap: AppSettings.openNotificationSettings,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionRefreshButton(
    BuildContext context,
    NotificationsState state,
  ) {
    if (state.isRefreshingPermissions) {
      return CircularProgressIndicator(color: context.color.secondary);
    } else {
      return IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          context.read<NotificationsProvider>().refreshPermission();
        },
      );
    }
  }
}

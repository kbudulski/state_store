import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/settings/notifications/provider/notifications_provider.dart';
import 'package:riverpod_app/providers/user_data/user_data_provider.dart';
import 'package:shared_dependencies/app_settings.dart';
import 'package:shared_dependencies/flex_color_scheme.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';

class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: Padding(
        padding: const EdgeInsets.all(Dimens.size16).copyWith(
          top: Dimens.size20,
        ),
        child: AppTileGroup(
          cards: [
            Consumer(
              builder: (context, ref, _) {
                final state = ref.watch(notificationsProvider);
                return AppListTile(
                  icon: Icons.lock_open,
                  title: state.status.name.capitalize,
                  subtitle: 'Permissions status',
                  iconBackgroundColor: Colors.cyan,
                  trailing: _buildPermissionRefreshButton(context, ref, state),
                );
              },
            ),
            Consumer(
              builder: (context, ref, _) => AppSwitchCard(
                icon: Icons.access_time,
                title: 'Daily',
                subtitle: 'Subscribe to daily messages',
                value: ref.watch(userDataProvider).subscribedToDaily,
                onChanged: (value) {
                  ref
                      .read(notificationsProvider.notifier)
                      .toggleDaily(subscribed: value);
                  ref.read(userDataProvider.notifier).saveDailySubscription();
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
    WidgetRef ref,
    NotificationsState state,
  ) {
    if (state.isRefreshingPermissions) {
      return CircularProgressIndicator(color: context.color.secondary);
    } else {
      return IconButton(
        icon: const Icon(Icons.refresh),
        onPressed: () {
          ref.read(notificationsProvider.notifier).refreshPermission();
        },
      );
    }
  }
}

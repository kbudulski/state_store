import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/settings/notifications/provider/notifications_provider.dart';
import 'package:riverpod_app/features/settings/theme/provider/theme_provider.dart';
import 'package:riverpod_app/navigation/routes/app_routes.dart';
import 'package:riverpod_app/providers/auth_provider.dart';
import 'package:riverpod_app/providers/network_provider.dart';
import 'package:shared_dependencies/connectivity_plus.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(themesProvider);
    _showDialogOnDisconnectedNetwork(ref, context);
    _handleNotifications(context, ref);
    return VRouter(
      title: 'Riverpod app',
      theme: AppTheme.light(state.colorScheme),
      darkTheme: AppTheme.dark(state.colorScheme),
      themeMode: state.themeMode,
      debugShowCheckedModeBanner: false,
      navigatorKey: rootNavigatorKey,
      initialUrl: _getInitialUrl(ref),
      routes: buildAppRoutes(ref.read(authProvider).isSignedIn),
    );
  }

  void _showDialogOnDisconnectedNetwork(WidgetRef ref, BuildContext context) {
    ref.listen<ConnectivityResult?>(networkProvider,
        (_, ConnectivityResult? state) {
      if (!state.isConnected) {
        if (rootNavigatorKey.currentContext == null) return;
        showDialog<void>(
          context: rootNavigatorKey.currentContext!,
          builder: (_) => ConnectivityDialog(rootNavigatorKey.currentContext!),
        );
      }
    });
  }

  void _handleNotifications(context, WidgetRef ref) {
    ref.listen<NotificationsState>(notificationsProvider, (prev, next) {
      if (next.path == null && next.dailyText == null) return;
      if (prev?.path != next.path && next.path != null) {
        VRouter.of(rootNavigatorKey.currentContext!).to(next.path!);
      }
      if (prev?.dailyText != next.dailyText && next.dailyText != null) {
        showDialog<void>(
          context: rootNavigatorKey.currentContext!,
          builder: (_) => AlertDialog(
            title: const Text('Daily reminder'),
            content: Text(next.dailyText!),
          ),
        );
      }
      ref.read(notificationsProvider.notifier).cleanMessagePayloadFromState();
    });
  }

  String _getInitialUrl(WidgetRef ref) =>
      ref.read(authProvider).isSignedIn ? Paths.home : Paths.login;
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/settings/theme/provider/theme_provider.dart';
import 'package:riverpod_app/navigation/routes/app_routes.dart';
import 'package:riverpod_app/providers/auth_provider.dart';
import 'package:riverpod_app/providers/network_provider.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => MyAppState();
}

class MyAppState extends ConsumerState<MyApp> {
  bool eagerProvidersInitialized = false;

  void _initializeEagerProviders() {
    final eagerProviders = [
      themesProvider,
    ];
    final states = eagerProviders.map(ref.watch).toList();
    if (states.every((state) => state is AsyncData)) {
      Future(() => setState(() => eagerProvidersInitialized = true));
    }
  }

  @override
  Widget build(BuildContext context) {
    _initializeEagerProviders();
    if (!eagerProvidersInitialized) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return const AppView();
    }
  }
}

class AppView extends ConsumerWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(themesProvider).value;
    _showDialogOnDisconnectedNetwork(ref, context);
    return VRouter(
      title: 'Riverpod app',
      theme: AppTheme.light(state?.colorScheme),
      darkTheme: AppTheme.dark(state?.colorScheme),
      themeMode: state?.themeMode,
      debugShowCheckedModeBanner: false,
      navigatorKey: rootNavigatorKey,
      initialUrl: _getInitialUrl(ref),
      routes: buildAppRoutes(ref.read(authProvider).isSignedIn),
    );
  }

  void _showDialogOnDisconnectedNetwork(WidgetRef ref, BuildContext context) {
    ref.listen<NetworkState>(networkProvider, (_, NetworkState state) {
      if (!state.isConnected) {
        if (rootNavigatorKey.currentContext == null) return;
        showDialog<void>(
          context: rootNavigatorKey.currentContext!,
          builder: (_) => ConnectivityDialog(rootNavigatorKey.currentContext!),
        );
      }
    });
  }

  String _getInitialUrl(WidgetRef ref) =>
      ref.read(authProvider).isSignedIn ? Paths.home : Paths.login;
}

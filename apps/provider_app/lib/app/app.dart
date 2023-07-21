import 'package:api_repository/api_repository.dart';
import 'package:authentication_service/authentication_service.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:location_service/location_service.dart';
import 'package:notification_service/notification_service.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/features/settings/theme/provider/theme_provider.dart';
import 'package:provider_app/features/settings/theme/provider/theme_state.dart';
import 'package:provider_app/navigation/routes/app_routes.dart';
import 'package:provider_app/providers/auth/auth_provider.dart';
import 'package:provider_app/providers/user_data/user_data_provider.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:shared_dependencies/nb_utils.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/components.dart';
import 'package:styleguide/style.dart';
import 'package:utils/utils.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class MyApp extends StatelessWidget {
  const MyApp({
    required this.authService,
    required this.notificationService,
    required this.firestoreUserRepository,
    required this.firestoreImageRepository,
    required this.realtimeChatRepository,
    required this.apiRepository,
    required this.connectivity,
    required this.locationService,
    required this.prefs,
    super.key,
  });

  final AuthenticationService authService;
  final NotificationService notificationService;
  final FirestoreUserRepository firestoreUserRepository;
  final FirestoreImageRepository firestoreImageRepository;
  final RealtimeChatRepository realtimeChatRepository;
  final ApiRepository apiRepository;
  final Connectivity connectivity;
  final LocationService locationService;
  final SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => authService),
        Provider(create: (_) => firestoreImageRepository),
        Provider(create: (_) => realtimeChatRepository),
        Provider(create: (_) => apiRepository),
        Provider(create: (_) => prefs),
        StreamProvider<ConnectivityResult?>(
          create: (_) => connectivity.onConnectivityChanged,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (_) => UserDataProvider(
            firestoreUserRepository: firestoreUserRepository,
          ),
        ),
        StateNotifierProvider<AuthProvider, AuthState>(
          create: (_) => AuthProvider(authService: authService),
        ),
        StateNotifierProvider<ThemeProvider, ThemeState>(
          create: (_) => ThemeProvider(prefs)..initializeTheme(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    _showDialogOnDisconnectedNetwork(context);
    return StateNotifierBuilder<ThemeState>(
      stateNotifier: context.read<ThemeProvider>(),
      builder: (context, state, widget) {
        return VRouter(
          title: 'Provider app',
          theme: AppTheme.light(state.colorScheme),
          darkTheme: AppTheme.dark(state.colorScheme),
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
          navigatorKey: rootNavigatorKey,
          initialUrl: _getInitialUrl(context),
          routes: buildAppRoutes(context.read<AuthProvider>().isSignedIn),
        );
      },
    );
  }

  void _showDialogOnDisconnectedNetwork(BuildContext context) {
    final networkState = context.watch<ConnectivityResult?>();
    if (!networkState.isConnected) {
      if (rootNavigatorKey.currentContext == null) return;
      showDialog<void>(
        context: rootNavigatorKey.currentContext!,
        builder: (_) => ConnectivityDialog(rootNavigatorKey.currentContext!),
      );
    }
  }

  String _getInitialUrl(BuildContext context) =>
      context.read<AuthProvider>().isSignedIn ? Paths.home : Paths.login;
}

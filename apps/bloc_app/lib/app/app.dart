import 'package:api_repository/api_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_app/features/global/auth/auth_cubit.dart';
import 'package:bloc_app/features/global/user_data/user_data_cubit.dart';
import 'package:bloc_app/features/settings/notifications/cubit/notifications_cubit.dart';
import 'package:bloc_app/features/settings/theme/cubit/theme_cubit.dart';
import 'package:bloc_app/features/settings/theme/cubit/theme_state.dart';
import 'package:bloc_app/utils/navigation/paths.dart';
import 'package:bloc_app/utils/navigation/routes/app_routes.dart';
import 'package:firestore_feed_repository/firestore_feed_repository.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:shared_dependencies/vrouter.dart';
import 'package:styleguide/style.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class MyApp extends StatelessWidget {
  const MyApp({
    required this.authRepository,
    required this.notificationRepository,
    required this.firestoreUserRepository,
    required this.firestoreFeedRepository,
    required this.realtimeChatRepository,
    required this.apiRepository,
    super.key,
  });

  final AuthenticationRepository authRepository;
  final NotificationRepository notificationRepository;
  final FirestoreUserRepository firestoreUserRepository;
  final FirestoreFeedRepository firestoreFeedRepository;
  final RealtimeChatRepository realtimeChatRepository;
  final ApiRepository apiRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => authRepository),
        RepositoryProvider(create: (_) => notificationRepository),
        RepositoryProvider(create: (_) => firestoreUserRepository),
        RepositoryProvider(create: (_) => firestoreFeedRepository),
        RepositoryProvider(create: (_) => realtimeChatRepository),
        RepositoryProvider(create: (_) => apiRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => AuthCubit(authRepository: authRepository),
          ),
          BlocProvider(
            create: (_) => NotificationsCubit(
              notificationRepository: notificationRepository,
            )..init(),
            lazy: false,
          ),
          BlocProvider(
            create: (_) => ThemeCubit(),
          ),
          BlocProvider(
            create: (_) => UserDataCubit(
              firestoreUserRepository: firestoreUserRepository,
            ),
            lazy: false,
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return VRouter(
          title: 'Bloc app',
          theme: AppTheme.light(state.colorScheme),
          darkTheme: AppTheme.dark(state.colorScheme),
          themeMode: state.themeMode,
          debugShowCheckedModeBanner: false,
          navigatorKey: rootNavigatorKey,
          initialUrl: _getInitialUrl(context),
          routes: buildAppRoutes(context),
        );
      },
    );
  }

  String _getInitialUrl(BuildContext context) =>
      context.read<AuthCubit>().isSignedIn ? Paths.home : Paths.login;
}

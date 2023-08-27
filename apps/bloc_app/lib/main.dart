import 'package:analytics_service/analytics_service.dart';
import 'package:api_repository/api_repository.dart';
import 'package:authentication_service/authentication_service.dart';
import 'package:bloc_app/app/app.dart';
import 'package:bloc_app/global_bloc_observer.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:location_service/location_service.dart';
import 'package:notification_service/notification_service.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:shared_dependencies/dio.dart';
import 'package:shared_dependencies/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = GlobalBlocObserver();
  await initializeFirebase();

  final authService = AuthenticationService();
  await authService.user.first;

  final notificationService = NotificationService();
  await notificationService.requestPermission();
  await notificationService.setupLocalNotifications();

  final locationService = LocationService();

  final remoteConfigService = RemoteConfigService();
  await remoteConfigService.initialize();

  final analyticsService = AnalyticsService();

  final firestoreUserRepository = FirestoreUserRepository();
  final firestoreImageRepository = FirestoreImageRepository();
  final realtimeChatRepository = RealtimeChatRepository();

  final apiRepository = ApiRepository(
    Dio(
      BaseOptions(
        queryParameters: {
          'key': const String.fromEnvironment('API_KEY'),
        },
      ),
    ),
  );

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(
    MyApp(
      authService: authService,
      notificationService: notificationService,
      locationService: locationService,
      remoteConfigService: remoteConfigService,
      analyticsService: analyticsService,
      firestoreUserRepository: firestoreUserRepository,
      firestoreImageRepository: firestoreImageRepository,
      realtimeChatRepository: realtimeChatRepository,
      apiRepository: apiRepository,
    ),
  );
}

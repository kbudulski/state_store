import 'package:api_repository/api_repository.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_app/app/app.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:location_service/location_service.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:shared_dependencies/connectivity_plus.dart';
import 'package:shared_dependencies/dio.dart';
import 'package:shared_dependencies/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  final authRepository = AuthenticationRepository();
  await authRepository.user.first;

  final notificationRepository = NotificationRepository();
  await notificationRepository.requestPermission();
  await notificationRepository.setupLocalNotifications();

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

  final connectivity = Connectivity();
  final locationService = LocationService();

  runApp(
    MyApp(
      authRepository: authRepository,
      notificationRepository: notificationRepository,
      firestoreUserRepository: firestoreUserRepository,
      firestoreImageRepository: firestoreImageRepository,
      realtimeChatRepository: realtimeChatRepository,
      apiRepository: apiRepository,
      connectivity: connectivity,
      locationService: locationService,
    ),
  );
}

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_app/app/app.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  final authRepository = AuthenticationRepository();
  await authRepository.user.first;

  final notificationRepository = NotificationRepository();
  await notificationRepository.requestPermission();
  await notificationRepository.setupLocalNotifications();

  final firestoreUserRepository = FirestoreUserRepository();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );

  runApp(
    MyApp(
      authRepository: authRepository,
      notificationRepository: notificationRepository,
      firestoreUserRepository: firestoreUserRepository,
    ),
  );
}

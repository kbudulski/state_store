import 'package:authentication_service/authentication_service.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_service/notification_service.dart';
import 'package:riverpod_app/app/app.dart';
import 'package:riverpod_app/providers/service_providers.dart';
import 'package:riverpod_app/providers/shared_prefs_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();

  final authService = AuthenticationService();
  await authService.user.first;

  final notificationService = NotificationService();
  await notificationService.requestPermission();
  await notificationService.setupLocalNotifications();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        authServiceProvider.overrideWith((_) => authService),
        notificationServiceProvider.overrideWith((_) => notificationService),
        sharedPrefsProvider.overrideWith((_) => prefs),
      ],
      child: const MyApp(),
    ),
  );
}

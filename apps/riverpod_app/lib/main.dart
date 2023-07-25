import 'dart:async';

import 'package:authentication_service/authentication_service.dart';
import 'package:firebase_service/firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notification_service/notification_service.dart';
import 'package:riverpod_app/app/app.dart';
import 'package:riverpod_app/features/settings/notifications/provider/notifications_provider.dart';
import 'package:riverpod_app/features/settings/theme/provider/theme_provider.dart';
import 'package:riverpod_app/global_provider_observer.dart';
import 'package:riverpod_app/providers/service_providers.dart';
import 'package:riverpod_app/providers/shared_prefs/shared_prefs_provider.dart';
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

  final container = ProviderContainer(
    overrides: [
      authServiceProvider.overrideWith((_) => authService),
      notificationServiceProvider.overrideWith((_) => notificationService),
      sharedPrefsProvider.overrideWith((_) => prefs),
    ],
    observers: [GlobalProviderObserver()],
  );
  await container.read(themesProvider.notifier).initializeTheme();
  unawaited(container.read(notificationsProvider.notifier).init());

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

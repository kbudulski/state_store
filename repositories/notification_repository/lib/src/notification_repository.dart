import 'dart:async';
import 'dart:convert';

import 'package:firebase_dependencies/firebase_messaging.dart';
import 'package:notification_repository/notification_repository.dart';
import 'package:shared_dependencies/flutter_local_notifications.dart';

class NotificationRepository {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  late AndroidNotificationChannel _channel;

  Future<AuthorizationStatus> requestPermission() async {
    final response = await _firebaseMessaging.requestPermission();
    return response.authorizationStatus;
  }

  Future<AuthorizationStatus> getPermissionStatus() async {
    final settings = await _firebaseMessaging.getNotificationSettings();
    return settings.authorizationStatus;
  }

  Future<NotificationData?> onAppLaunchedFromMessage() async {
    final message = await _firebaseMessaging.getInitialMessage();
    if (message == null) return null;
    return NotificationData.fromJson(message.data);
  }

  Future<void> startListeningToNotifications(
    void Function(NotificationData data) onNotificationPressed,
  ) async {
    await _initForegroundNotifications(onNotificationPressed);
    _initBackgroundNotifications(onNotificationPressed);
  }

  void _initBackgroundNotifications(
    void Function(NotificationData data) onNotificationPressed,
  ) {
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      onNotificationPressed(NotificationData.fromJson(event.data));
    });
  }

  Future<void> _initForegroundNotifications(
    void Function(NotificationData data) onNotificationPressed,
  ) async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    await _flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(android: android),
      onDidReceiveNotificationResponse: (response) {
        if (response.payload == null) return;
        final map = json.decode(response.payload!) as Map<String, dynamic>;
        final data = NotificationData.fromJson(map);
        onNotificationPressed(data);
      },
    );
  }

  Future<void> changeSubscription(Topic topic, {required bool sub}) async {
    if (sub) {
      return _firebaseMessaging.subscribeToTopic(topic.name);
    } else {
      return _firebaseMessaging.unsubscribeFromTopic(topic.name);
    }
  }

  Future<void> setupLocalNotifications() async {
    await _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    FirebaseMessaging.onMessage.listen(showLocalMessage);
  }

  Future<void> showLocalMessage(RemoteMessage message) async {
    final notification = message.notification;
    final android = message.notification?.android;

    if (notification != null && android != null) {
      await _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
          ),
        ),
        payload: json.encode(message.data),
      );
    }
  }
}

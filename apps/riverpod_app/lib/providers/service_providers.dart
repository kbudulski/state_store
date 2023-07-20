import 'package:authentication_service/authentication_service.dart';
import 'package:location_service/location_service.dart';
import 'package:notification_service/notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'service_providers.g.dart';

@riverpod
AuthenticationService authService(AuthServiceRef ref) {
  throw UnimplementedError();
}

@riverpod
NotificationService notificationService(NotificationServiceRef ref) {
  throw UnimplementedError();
}

@riverpod
LocationService locationService(LocationServiceRef ref) {
  return LocationService();
}

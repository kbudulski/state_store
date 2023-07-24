import 'package:firebase_dependencies/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_service/notification_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/providers/service_providers.dart';

part 'notifications_provider.freezed.dart';
part 'notifications_provider.g.dart';

@Riverpod(keepAlive: true)
class Notifications extends _$Notifications {
  @override
  NotificationsState build() {
    _notificationService = ref.read(notificationServiceProvider);
    return const NotificationsState();
  }

  late final NotificationService _notificationService;

  Future<void> init() async {
    await _notificationService.startListeningToNotifications(_onMessageTap);
    final data = await _notificationService.onAppLaunchedFromMessage();
    final permission = await _notificationService.getPermissionStatus();
    state = state.copyWith(status: permission);
    _onMessageTap(data);
  }

  void refreshPermission() {
    if (state.isRefreshingPermissions) return;
    state = state.copyWith(isRefreshingPermissions: true);
    _notificationService.getPermissionStatus().then(
      (permission) {
        state = state.copyWith(
          status: permission,
          isRefreshingPermissions: false,
        );
      },
    );
  }

  Future<void> toggleDaily({required bool subscribed}) async {
    await _notificationService.changeSubscription(
      Topic.daily,
      sub: subscribed,
    );
  }

  void _onMessageTap(NotificationData? data) {
    if (data == null) return;
    if (data.path != null) {
      state = state.copyWith(path: data.path);
    }
    if (data.daily != null) {
      state = state.copyWith(dailyText: data.daily);
    }
  }

  void cleanMessagePayloadFromState() {
    state = state.copyWith(dailyText: null, path: null);
  }
}

@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState({
    @Default(AuthorizationStatus.notDetermined) AuthorizationStatus status,
    @Default(false) bool isRefreshingPermissions,
    String? dailyText,
    String? path,
  }) = _NotificationsState;
}

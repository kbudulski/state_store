import 'package:firebase_dependencies/firebase_messaging.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_service/notification_service.dart';

part 'notifications_provider.freezed.dart';

class NotificationsProvider extends StateNotifier<NotificationsState> {
  NotificationsProvider({
    required this.notificationService,
  }) : super(const NotificationsState()) {
    notificationService.startListeningToNotifications(_onMessageTap);
  }

  final NotificationService notificationService;

  Future<void> init() async {
    final data = await notificationService.onAppLaunchedFromMessage();
    final permission = await notificationService.getPermissionStatus();
    state = state.copyWith(status: permission);
    _onMessageTap(data);
  }

  void refreshPermission() {
    if (state.isRefreshingPermissions) return;
    state = state.copyWith(isRefreshingPermissions: true);
    notificationService.getPermissionStatus().then(
      (permission) {
        state = state.copyWith(
          status: permission,
          isRefreshingPermissions: false,
        );
      },
    );
  }

  Future<void> toggleDaily({required bool subscribed}) async {
    await notificationService.changeSubscription(
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

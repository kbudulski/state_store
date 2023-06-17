import 'package:bloc/bloc.dart';
import 'package:firebase_dependencies/firebase_dependencies.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:notification_repository/notification_repository.dart';

part 'notifications_cubit.freezed.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit({
    required this.notificationRepository,
  }) : super(const NotificationsState()) {
    notificationRepository.startListeningToNotifications(_onMessageTap);
  }

  final NotificationRepository notificationRepository;

  Future<void> init() async {
    final data = await notificationRepository.onAppLaunchedFromMessage();
    final permission = await notificationRepository.getPermissionStatus();
    emit(state.copyWith(status: permission));
    _onMessageTap(data);
  }

  void refreshPermission() {
    if (state.isRefreshingPermissions) return;
    emit(state.copyWith(isRefreshingPermissions: true));
    notificationRepository.getPermissionStatus().then(
      (permission) {
        emit(
          state.copyWith(
            status: permission,
            isRefreshingPermissions: false,
          ),
        );
      },
    );
  }

  Future<void> toggleDaily({required bool subscribed}) async {
    await notificationRepository.changeSubscription(
      Topic.daily,
      sub: subscribed,
    );
  }

  void _onMessageTap(NotificationData? data) {
    if (data == null) return;
    if (data.path != null) {
      emit(state.copyWith(path: data.path));
    }
    if (data.daily != null) {
      emit(state.copyWith(dailyText: data.daily));
    }
    _cleanMessagePayloadFromState();
  }

  void _cleanMessagePayloadFromState() {
    emit(state.copyWith(dailyText: null, path: null));
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

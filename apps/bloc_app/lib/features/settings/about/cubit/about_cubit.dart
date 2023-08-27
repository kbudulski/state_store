import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:remote_config_service/remote_config_service.dart';
import 'package:shared_dependencies/package_info_plus.dart';

part 'about_cubit.freezed.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit({
    required this.remoteConfigService,
  }) : super(const AboutState());

  final RemoteConfigService remoteConfigService;

  Future<void> initialize() async {
    emit(state.copyWith(isLoading: true));
    try {
      final info = await PackageInfo.fromPlatform();
      final remoteData = remoteConfigService.getRemoteData();
      final isLightSide = remoteConfigService.getSide();
      emit(
        state.copyWith(
          appVersion: info.version,
          photo: remoteData.photo,
          premium: remoteData.premium,
          isLightSide: isLightSide,
          isLoading: false,
        ),
      );
      _listenToRemoteConfigChanges();
    } catch (_) {
      emit(const AboutState());
    }
  }

  void _listenToRemoteConfigChanges() {
    remoteConfigService.onConfigUpdated(
      (params) {
        if (params.contains(RemoteKeys.sampleJson)) {
          final updatedRemoteData = remoteConfigService.getRemoteData();
          emit(
            state.copyWith(
              photo: updatedRemoteData.photo,
              premium: updatedRemoteData.premium,
            ),
          );
        }
        if (params.contains(RemoteKeys.lightSide)) {
          final updatedSideValue = remoteConfigService.getSide();
          emit(
            state.copyWith(
              isLightSide: updatedSideValue,
            ),
          );
        }
      },
    );
  }
}

@freezed
class AboutState with _$AboutState {
  const factory AboutState({
    @Default(false) bool isLoading,
    @Default(true) bool isLightSide,
    @Default(false) bool premium,
    String? photo,
    String? appVersion,
  }) = _AboutState;
}

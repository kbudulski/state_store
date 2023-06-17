import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_dependencies/shared_dependencies.dart';

part 'about_state.dart';

class AboutCubit extends Cubit<AboutState> {
  AboutCubit() : super(AboutStateLoading());

  Future<void> fetchAppVersion() async {
    emit(AboutStateLoading());
    try {
      final info = await PackageInfo.fromPlatform();
      emit(AboutStateLoaded(appVersion: info.version));
    } catch (_) {
      emit(const AboutStateLoaded(appVersion: 'Unknown'));
    }
  }
}

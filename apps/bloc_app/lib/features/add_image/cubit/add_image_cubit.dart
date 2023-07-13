import 'package:authentication_service/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:core_dependencies/file_picker.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_image_cubit.freezed.dart';

class AddImageCubit extends Cubit<AddImageState> {
  AddImageCubit(
    this.imageRepository,
    this.authService,
  ) : super(const AddImageState());

  final FirestoreImageRepository imageRepository;
  final AuthenticationService authService;

  void descriptionChanged(String value) {
    emit(state.copyWith(description: value));
  }

  Future<void> onFilePicked() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;
    emit(state.copyWith(file: result.files.first));
  }

  Future<void> uploadImage() async {
    if (state.isUploading || state.isSuccess) return;
    emit(state.copyWith(isUploading: true));
    final response = await imageRepository.uploadImage(
      file: state.file!,
      description: state.description,
      userId: authService.currentUser.id,
      userName: authService.currentUser.name ?? 'Anonymous',
      onProgress: (percent) => emit(state.copyWith(uploadPercent: percent)),
    );
    response.fold(
      _emitError,
      (_) => emit(
        state.copyWith(
          isUploading: false,
          isSuccess: true,
        ),
      ),
    );
  }

  void _emitError(Exception error) {
    emit(
      state.copyWith(
        error: error,
        isUploading: false,
      ),
    );
  }
}

@freezed
class AddImageState with _$AddImageState {
  const factory AddImageState({
    @Default('') String description,
    @Default(false) bool isUploading,
    @Default(false) bool isSuccess,
    @Default(0) double uploadPercent,
    PlatformFile? file,
    Exception? error,
  }) = _AddImageState;

  const AddImageState._();

  bool get areFieldsFilled => description.isNotEmpty && file != null;
}

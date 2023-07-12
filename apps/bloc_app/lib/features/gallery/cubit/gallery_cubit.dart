import 'package:bloc/bloc.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery_cubit.freezed.dart';

class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit({required this.imageRepository}) : super(const GalleryState());

  final FirestoreImageRepository imageRepository;

  Future<void> fetchImages() async {
    emit(state.copyWith(isLoading: true));
    final response = await imageRepository.fetchImages();
    response.fold(
      _emitError,
      (images) => emit(
        state.copyWith(
          images: images,
          isLoading: false,
        ),
      ),
    );
  }

  void _emitError(Exception error) => emit(
        state.copyWith(
          error: error,
          isLoading: false,
        ),
      );

  Future<void> deleteImage(FireImage image) async {
    if (state.isLoading) return;
    emit(state.copyWith(isLoading: true));
    final response = await imageRepository.deleteImage(image);
    response.fold(
      _emitError,
      (_) => emit(
        state.copyWith(
          images: List.from(state.images)..remove(image),
          isFileDeleted: true,
          isLoading: false,
        ),
      ),
    );
  }

  void resetState() {
    emit(
      state.copyWith(
        isLoading: false,
        isFileDeleted: false,
        error: null,
      ),
    );
  }
}

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState({
    @Default([]) List<FireImage> images,
    @Default(false) bool isLoading,
    @Default(false) bool isFileDeleted,
    Exception? error,
  }) = _GalleryState;
}

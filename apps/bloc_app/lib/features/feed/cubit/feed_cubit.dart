import 'package:bloc/bloc.dart';
import 'package:firestore_feed_repository/firestore_feed_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'feed_cubit.freezed.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit(this.feedRepository) : super(const FeedState());

  final FirestoreFeedRepository feedRepository;

  Future<void> fetchPosts() async {
    emit(state.copyWith(isLoading: true));
    final response = await feedRepository.fetchPosts();
    response.fold(
      _emitError,
      (posts) => emit(
        state.copyWith(
          posts: posts,
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
}

@freezed
class FeedState with _$FeedState {
  const factory FeedState({
    @Default([]) List<Post> posts,
    @Default(false) bool isLoading,
    Exception? error,
  }) = _FeedState;
}

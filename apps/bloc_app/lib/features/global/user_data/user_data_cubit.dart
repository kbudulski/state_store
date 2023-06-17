import 'package:bloc/bloc.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_cubit.freezed.dart';

class UserDataCubit extends Cubit<UserDataState> {
  UserDataCubit({
    required this.firestoreUserRepository,
  }) : super(const UserDataState()) {
    firestoreUserRepository.readMessagingTopic().listen((data) {
      emit(state.copyWith(userData: data));
    });
  }

  final FirestoreUserRepository firestoreUserRepository;

  bool get subscribedToDaily => state.userData?.subscribedToDaily ?? false;

  Future<void> saveDailySubscription() {
    return firestoreUserRepository.subscribeToDaily(
      subscribed: !subscribedToDaily,
    );
  }
}

@freezed
class UserDataState with _$UserDataState {
  const factory UserDataState({
    UserData? userData,
  }) = _UserDataState;

  const UserDataState._();
}

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authRepository,
  }) : super(
          authRepository.currentUser == AppUser.empty
              ? const AuthState.unauthenticated()
              : AuthState.signedIn(authRepository.currentUser),
        ) {
    _listenToUserState(authRepository.user);
  }

  final AuthenticationRepository authRepository;

  bool get isSignedIn => state.status == AuthStatus.signedIn;

  void _listenToUserState(Stream<AppUser> user) {
    user.listen((user) {
      if (user == AppUser.empty) {
        emit(const AuthState.unauthenticated());
      } else {
        emit(AuthState.signedIn(user));
      }
    });
  }

  Future<void> signOut() async => authRepository.signOut();
}

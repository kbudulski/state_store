import 'package:authentication_service/authentication_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({
    required this.authService,
  }) : super(
          authService.currentUser == AppUser.empty
              ? const AuthState.unauthenticated()
              : AuthState.signedIn(authService.currentUser),
        ) {
    _listenToUserState(authService.user);
  }

  final AuthenticationService authService;

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

  Future<void> signOut() async => authService.signOut();
}

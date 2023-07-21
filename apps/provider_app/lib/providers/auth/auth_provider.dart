import 'package:authentication_service/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';

part 'auth_state.dart';

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider({
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
        state = const AuthState.unauthenticated();
      } else {
        state = AuthState.signedIn(user);
      }
    });
  }

  Future<void> signOut() async => authService.signOut();
}

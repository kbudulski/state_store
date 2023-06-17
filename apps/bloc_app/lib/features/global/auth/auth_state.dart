part of 'auth_cubit.dart';

enum AuthStatus { initial, signedIn, signedOut }

class AuthState extends Equatable {
  const AuthState._({
    required this.status,
    this.user = AppUser.empty,
  });

  const AuthState.signedIn(AppUser user)
      : this._(status: AuthStatus.signedIn, user: user);

  const AuthState.unauthenticated() : this._(status: AuthStatus.signedOut);

  final AuthStatus status;
  final AppUser user;

  @override
  List<Object> get props => [status, user];
}

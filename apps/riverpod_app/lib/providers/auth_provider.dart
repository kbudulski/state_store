import 'package:authentication_service/authentication_service.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_app/providers/service_providers.dart';

part 'auth_provider.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  AuthState build() {
    _listenToUserState(ref.read(authServiceProvider).user);
    final user = ref.read(authServiceProvider).currentUser;
    return user == AppUser.empty
        ? const AuthState.unauthenticated()
        : AuthState.signedIn(user);
  }

  void _listenToUserState(Stream<AppUser> user) {
    user.listen((user) {
      if (user == AppUser.empty) {
        state = const AuthState.unauthenticated();
      } else {
        state = AuthState.signedIn(user);
      }
    });
  }

  Future<void> signOut() async => ref.read(authServiceProvider).signOut();
}

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

  bool get isSignedIn => status == AuthStatus.signedIn;

  @override
  List<Object> get props => [status, user];
}

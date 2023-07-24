import 'package:equatable/equatable.dart';
import 'package:firebase_dependencies/firebase_auth.dart';

class AppUser extends Equatable {
  const AppUser({
    required this.id,
    this.email,
    this.name,
    this.photoURL,
    this.emailVerified,
    this.lastSignInTime,
    this.creationTime,
  });

  final String id;
  final String? email;
  final String? name;
  final String? photoURL;
  final bool? emailVerified;
  final DateTime? lastSignInTime;
  final DateTime? creationTime;

  static const empty = AppUser(id: '');

  bool get isEmpty => this == AppUser.empty;

  @override
  List<Object?> get props => [id, name];
}

extension AppUserExt on User {
  AppUser get toUser => AppUser(
        id: uid,
        email: email,
        name: displayName,
        photoURL: photoURL,
        emailVerified: emailVerified,
        lastSignInTime: metadata.lastSignInTime,
        creationTime: metadata.creationTime,
      );
}

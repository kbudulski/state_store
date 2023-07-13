import 'package:equatable/equatable.dart';

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

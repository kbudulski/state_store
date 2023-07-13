import 'dart:async';

import 'package:authentication_service/authentication_service.dart';
import 'package:firebase_dependencies/firebase_auth.dart';

class AuthenticationService {
  final _firebaseAuth = FirebaseAuth.instance;

  Stream<AppUser> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      return firebaseUser == null ? AppUser.empty : firebaseUser.toUser;
    });
  }

  AppUser get currentUser {
    final firebaseUser = _firebaseAuth.currentUser;
    return firebaseUser == null ? AppUser.empty : firebaseUser.toUser;
  }

  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}

extension on User {
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

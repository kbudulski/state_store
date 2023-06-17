import 'dart:async';

import 'package:firebase_dependencies/firebase_dependencies.dart';
import 'package:firebase_firestore/firebase_firestore.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';

class FirestoreUserRepository {
  final _userDataDocument = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.uid)
      .withConverter<UserData>(
        fromFirestore: (snapshot, _) => UserData.fromJson(snapshot.data()!),
        toFirestore: (userData, _) => userData.toJson(),
      );

  Stream<UserData?> readMessagingTopic() {
    return _userDataDocument.snapshots().map((event) => event.data());
  }

  Future<void> subscribeToDaily({required bool subscribed}) {
    return _userDataDocument.set(UserData(subscribedToDaily: subscribed));
  }
}

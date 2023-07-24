import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/providers/repository_providers.dart';

class UserDataProvider with ChangeNotifier {
  UserDataProvider({required this.firestoreUserRepository}) {
    firestoreUserRepository.readMessagingTopic().listen((data) {
      userData = data;
      notifyListeners();
    });
  }

  UserData? userData;

  final FirestoreUserRepository firestoreUserRepository;

  bool get subscribedToDaily => userData?.subscribedToDaily ?? false;

  Future<void> saveDailySubscription() {
    return firestoreUserRepository.subscribeToDaily(
      subscribed: !subscribedToDaily,
    );
  }
}

final userDataProvider = ChangeNotifierProvider<UserDataProvider>((ref) {
  return UserDataProvider(
    firestoreUserRepository: ref.read(firestoreUserRepositoryProvider),
  );
});

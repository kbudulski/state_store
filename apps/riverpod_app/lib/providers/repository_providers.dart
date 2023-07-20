import 'package:api_repository/api_repository.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';
import 'package:firestore_user_repository/firestore_user_repository.dart';
import 'package:realtime_chat_repository/realtime_chat_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_dependencies/dio.dart';

part 'repository_providers.g.dart';

@riverpod
ApiRepository apiRepository(ApiRepositoryRef ref) {
  return ApiRepository(
    Dio(
      BaseOptions(
        queryParameters: {
          'key': const String.fromEnvironment('API_KEY'),
        },
      ),
    ),
  );
}

@riverpod
FirestoreUserRepository firestoreUserRepository(
  FirestoreUserRepositoryRef ref,
) {
  return FirestoreUserRepository();
}

@riverpod
FirestoreImageRepository firestoreImageRepository(
  FirestoreImageRepositoryRef ref,
) {
  return FirestoreImageRepository();
}

@riverpod
RealtimeChatRepository realtimeChatRepository(
  RealtimeChatRepositoryRef ref,
) {
  return RealtimeChatRepository();
}

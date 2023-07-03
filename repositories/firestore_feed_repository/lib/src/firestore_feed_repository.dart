import 'package:core_dependencies/dartz.dart';
import 'package:firebase_dependencies/cloud_firestore.dart';
import 'package:firestore_feed_repository/firestore_feed_repository.dart';

class FirestoreFeedRepository {
  final _postsRef =
      FirebaseFirestore.instance.collection('posts').withConverter<Post>(
            fromFirestore: (snapshot, _) => Post.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson(),
          );

  Future<Either<Exception, List<Post>>> fetchPosts() async {
    try {
      return _postsRef.orderBy('date', descending: true).get().then(
        (snapshot) {
          return Right(snapshot.docs.map((e) => e.data()).toList());
        },
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> savePost(Post post) async {
    try {
      await _postsRef.add(post);
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

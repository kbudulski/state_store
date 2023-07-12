import 'dart:io';

import 'package:core_dependencies/dartz.dart';
import 'package:core_dependencies/file_picker.dart';
import 'package:firebase_dependencies/cloud_firestore.dart';
import 'package:firebase_dependencies/firebase_storage.dart';
import 'package:firestore_image_repository/firestore_image_repository.dart';

class FirestoreImageRepository {
  final _storageRef = FirebaseStorage.instance.ref('images');
  final _imagesRef = FirebaseFirestore.instance
      .collection('images')
      .withConverter<FireImage>(
        fromFirestore: (snapshot, _) => FireImage.fromJson(snapshot.data()!),
        toFirestore: (image, _) => image.toJson(),
      );

  Future<Either<Exception, List<FireImage>>> fetchImages() async {
    try {
      return _imagesRef.orderBy('createdOn', descending: true).get().then(
        (snapshot) {
          return Right(snapshot.docs.map((e) => e.data()).toList());
        },
      );
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> uploadImage({
    required PlatformFile file,
    required String description,
    required String userName,
    required String userId,
    required void Function(double percent) onProgress,
  }) async {
    try {
      final uploadTask = _storageRef.child(file.name).putFile(File(file.path!));
      uploadTask.snapshotEvents.listen(
        (upload) {
          final progress = upload.bytesTransferred / upload.totalBytes;
          onProgress(progress);
        },
      );
      await uploadTask;
      final url = await _storageRef.child(file.name).getDownloadURL();
      await _imagesRef.doc(file.name + userId).set(
            FireImage(
              url: url,
              userName: userName,
              userId: userId,
              createdOn: DateTime.now(),
              description: description,
              fileName: file.name,
              size: file.size,
            ),
          );
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  Future<Either<Exception, void>> deleteImage(FireImage image) async {
    try {
      await _storageRef.child(image.fileName).delete();
      await _imagesRef.doc(image.fileName + image.userId).delete();
      return const Right(null);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}

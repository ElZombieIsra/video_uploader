import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseRepository {
  static const String videosFolder = "videos";
  final StorageReference storageReference = FirebaseStorage().ref();

  /// Uploads a video to Firebase
  StorageUploadTask uploadVideo(String filename, File file) {
    return storageReference
        .child(videosFolder)
        .child("$filename.mp4")
        .putFile(file, StorageMetadata(contentType: 'video/mp4'));
  }
}

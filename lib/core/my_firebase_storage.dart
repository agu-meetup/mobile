import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class MyFirebaseStorage {
  final storage = FirebaseStorage.instance;
  // Create the file metadata
  final metadata = SettableMetadata(contentType: "image/jpeg");

  Future<String> takeImageUrl(String cloudImagePath) async {
    Reference? imagesRef =
        storage.ref().child(cloudImagePath);

    return await imagesRef.getDownloadURL();
  }

  Future<void> updateImage(
      String folderType, File imageFile, String specificFolderName, int orderOfImage) async {
    String cloudImagePath = "$folderType/$specificFolderName/$orderOfImage.jpg";
    await storage
        .ref()
        .child(cloudImagePath)
        .putFile(imageFile, metadata);
  }
}

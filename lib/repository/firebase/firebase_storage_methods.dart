import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:uuid/uuid.dart';

class FirebaseStorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //adding image to firebase storage
  Future<String> uploadImageToStorage(String childName, Uint8List file) async {
    Uint8List file2;
    double fileLengthInKB = file.lengthInBytes / 1024;
    if (fileLengthInKB > 0 && fileLengthInKB <= 150) {
      file2 = file;
    } else if (fileLengthInKB > 150 && fileLengthInKB <= 500) {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 70,
        rotate: 0,
      );
    } else if (fileLengthInKB > 500 && fileLengthInKB <= 1000) {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 60,
        rotate: 0,
      );
    } else if (fileLengthInKB > 1000 && fileLengthInKB <= 2000) {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 50,
        rotate: 0,
      );
    } else if (fileLengthInKB > 2000 && fileLengthInKB < 3000) {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 40,
        rotate: 0,
      );
    } else if (fileLengthInKB > 3000 && fileLengthInKB <= 4000) {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 30,
        rotate: 0,
      );
    } else if (fileLengthInKB > 4000 && fileLengthInKB <= 6000) {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 20,
        rotate: 0,
      );
    } else {
      file2 = await FlutterImageCompress.compressWithList(
        file,
        minHeight: 1920,
        minWidth: 1080,
        quality: 10,
        rotate: 0,
      );
    }

    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(file2);
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> uploadImageToStorageWithoutCompression(
      String childName, Uint8List file) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> uploadImageToStorageThumbnails(
      String childName, Uint8List file) async {
    Uint8List file2 = await FlutterImageCompress.compressWithList(
      file,
      minHeight: 200,
      minWidth: 200,
      quality: 10,
      rotate: 0,
    );

    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);

    UploadTask uploadTask = ref.putData(file2);
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }

  Future<String> uploadImageToStorageWithOutCompression(
      String childName, Uint8List file) async {
    Reference ref = _storage.ref().child(childName).child(const Uuid().v1());

    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;

    String downloadUrl = await snap.ref.getDownloadURL();

    return downloadUrl;
  }
}

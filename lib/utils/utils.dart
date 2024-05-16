import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  final pickedFile = await _imagePicker.getImage(source: source);

  if (pickedFile != null) {
    return await pickedFile.readAsBytes();
  } else {
    print("No image is selected");
    return null;
  }
}

void showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<List<Uint8List>> convertPickedFilesToUint8ListList(
    List<PickedFile> pickedFiles) async {
  List<Future<Uint8List>> futures =
      pickedFiles.map((pickedFile) => pickedFile.readAsBytes()).toList();
  List<Uint8List> uint8ListList = await Future.wait(futures);
  return uint8ListList;
}

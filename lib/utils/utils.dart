import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);

  if (_file != null) {
    return await _file.readAsBytes();
  } else {
    print("No image is selected");
  }
}

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<List<Uint8List>> convertXFileListToUint8ListList(
    List<XFile> xFileList) async {
  List<Future<Uint8List>> futures =
      xFileList.map((xFile) => xFile.readAsBytes()).toList();
  List<Uint8List> uint8ListList = await Future.wait(futures);
  return uint8ListList;
}
// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

Future<String?> imgPickerFromGallery() async {
  File file;
  var pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedImage == null) return null;
  file = File(pickedImage.path);
  int rand = Random().nextInt(10000000);
  String imageName = "$rand$basename(pickedImage.path)";
  var storage = FirebaseStorage.instance.ref('image').child(imageName);
  // var ref = FireBaseStorage()
  await storage.putFile(file);
  String imageUrl = await storage.getDownloadURL();
  return imageUrl;
}

Future<String?> imgPickerFromCamera() async {
  String? imageUrl;
  try {
    File file;
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedImage == null) return null;
    file = File(pickedImage.path);
    int rand = Random().nextInt(1000000000);
    String imageName = "$rand$basename(pickedImage.path)";
    var storage = FirebaseStorage.instance.ref('image').child(imageName);
    // var ref = FireBaseStorage()
    await storage.putFile(file);
    imageUrl = await storage.getDownloadURL();
  } catch (e) {
    debugPrint(e.toString());
  }
  return imageUrl;
}

// ignore_for_file: unused_local_variable

import 'dart:io';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

class ImagePickerService {
  Future<String> imagePickerFromGallery() async {
    File file;
    var pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    file = File(pickedImage!.path);
    int rand = Random().nextInt(10000000);
    String imageName = "$rand$basename(pickedImage.path)";
    var storage = FirebaseStorage.instance
        .ref('image')
        .child(imageName); // storage = image reference
    await storage.putFile(file);
    String imageUrl = await storage.getDownloadURL();
    return imageUrl;
  }

  Future<String> imagePickerFromCamera() async {
    File file;
    var pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);

    file = File(pickedImage!.path);
    int rand = Random().nextInt(1000000000);
    String imageName = "$rand$basename(pickedImage.path)";
    var storage = FirebaseStorage.instance.ref('image').child(imageName);
    await storage.putFile(file);
    String imageUrl = await storage.getDownloadURL();
    return imageUrl;
  }

  static Future<File?> pickImageFromGallery() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }

  static Future<File?> pickImageFromCamera() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      return File(image.path);
    } else {
      return null;
    }
  }
}

/* 
import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}



Future<File?> pickImageFromCamera() async {
  final ImagePicker picker = ImagePicker();
  // Pick an image
  final XFile? image = await picker.pickImage(source: ImageSource.camera);
  if (image != null) {
    return File(image.path);
  } else {
    return null;
  }
}

*/

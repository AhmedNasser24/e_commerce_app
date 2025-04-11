// import 'dart:math';

import 'dart:developer' as dev;
import 'dart:math';

import 'package:e_commerce/core/services/storage_services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';
import 'dart:io';

class FirebaseStorageServices implements StorageServices {
  final fireStorageReference = FirebaseStorage.instance.ref();
  @override
  Future<String> uploadFile(File file, String path) async {  // path is the folder name in firebase storage

    int rand = Random().nextInt(1000000000);
    String imageName = "$rand$basename(file.path)";
    dev.log("image name: $imageName");
    var storage = fireStorageReference.child("$path/$imageName");
    await storage.putFile(file);
    String imageUrl = await storage.getDownloadURL();
    return imageUrl;
  }
}
    

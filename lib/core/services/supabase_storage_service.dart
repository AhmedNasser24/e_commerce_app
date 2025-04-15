import 'dart:io';
import 'dart:math';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/storage_services.dart';
import 'package:path/path.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/product_item_model.dart';

class SupabaseStorageService implements StorageServices {
  static late SupabaseClient __supabase;
  static Future<void> init() async {
    await Supabase.initialize(url: kSupabaseUrl, anonKey: kSupabaseKey);
    __supabase = Supabase.instance.client;
  }

  static Future<void> createBucket(String bucketName) async {
    bool bucketExists = false;
    final response = await __supabase.storage.listBuckets();
    for (var bucket in response) {
      if (bucket.name == bucketName) {
        bucketExists = true;
        break;
      }
    }
    if (!bucketExists) {
      await __supabase.storage.createBucket(
          bucketName,
          BucketOptions(
            public: true, // authuntication is not required to access the bucket
          ));
      return;
    }
  }

  @override
  Future<String> uploadFile(ProductItemModel productItemModel) async {
    File file = productItemModel.imageFile!;
    String path = "product_images";
    // path is the folder name in firebase storage
    int rand = Random().nextInt(1000000000);
    String imageName = "$rand${basename(file.path)}";
   await __supabase.storage
        .from(kECommerceBucket)
        .upload("$path/$imageName", file);
    productItemModel.imagePath = "$path/$imageName";
    productItemModel.imageBucket = kECommerceBucket;
    return __getFileUrl("$path/$imageName");
  }

  @override
  Future<void> deleteFile(String path) async {
    await __supabase.storage.from(kECommerceBucket).remove([path]);
  }

  String __getFileUrl(String path) {
    String publicUrl =
        __supabase.storage.from(kECommerceBucket).getPublicUrl(path);
    return publicUrl;
  }
}

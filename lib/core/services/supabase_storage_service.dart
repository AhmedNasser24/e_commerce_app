import 'dart:io';
import 'dart:math';
import 'dart:developer' as dev;

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/storage_services.dart';
import 'package:path/path.dart';
import 'package:supabase/supabase.dart';

class SupabaseStorageService implements StorageServices {
  static late SupabaseClient __supabase;
  static void init() {
    __supabase = SupabaseClient(kSupabaseUrl, kSupabaseKey);
  }

  static Future <void> createBucket(String bucketName) async {
    bool bucketExists = false;
    final response = await __supabase.storage.listBuckets();
    for (var bucket in response) {
      if (bucket.name == bucketName) {
        bucketExists = true;
        break;
      }
    }
    if (!bucketExists) {
      await __supabase.storage.createBucket(bucketName);
      dev.log("Bucket created: $bucketName");
      return;
    }
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    // path is the folder name in firebase storage
    int rand = Random().nextInt(1000000000);
    String imageName = "$rand$basename(file.path)";
    final storageResponse = await __supabase.storage
        .from(kECommerceBucket)
        .upload("$path/$imageName", file);
    dev.log("storageResponse: $storageResponse");
    return __getFileUrl("$path/$imageName");
  }

  String __getFileUrl(String path) {
    String publicUrl =
        __supabase.storage.from(kECommerceBucket).getPublicUrl(path);
    return publicUrl;
  }
}

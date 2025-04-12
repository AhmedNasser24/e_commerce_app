import 'dart:io';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/services/storage_services.dart';
import 'package:supabase/supabase.dart';

class SupabaseStorageService implements StorageServices {
  static late var _supabase;
  static void init() {
    _supabase = SupabaseClient(kSupabaseUrl, kSupabaseKey);
  }
  
  @override
  Future<String> uploadFile(File file, String path) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}

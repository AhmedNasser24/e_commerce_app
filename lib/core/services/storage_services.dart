import 'dart:io';

abstract class StorageServices {
  Future < String > uploadFile(File file , String path);    // path is the folder name in firebase storage
}
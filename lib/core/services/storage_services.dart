import '../models/product_item_model.dart';

abstract class StorageServices {
  Future<void> uploadFile(ProductItemModel productItemModel);
  Future<void> deleteFile(String path);
  // path is the folder name in firebase storage

  Future<void> updateFile(ProductItemModel productItemModel);
}

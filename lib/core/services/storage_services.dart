
import '../models/product_item_model.dart';

abstract class StorageServices {
  Future<String> uploadFile(ProductItemModel productItemModel);   
  Future<void> deleteFile(String path); // path is the folder name in firebase storage
}
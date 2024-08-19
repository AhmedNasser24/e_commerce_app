import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/data/model/product_item_model.dart';

class FirebaseServices {
  Future<void> addProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId! ;
    log(productId) ;
    FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId) 
        .set(productItemModel.tojson());
  }
  Future<void> editProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId! ;
    FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId) 
        .set(productItemModel.tojson() , SetOptions(merge: true));
  }
  
}

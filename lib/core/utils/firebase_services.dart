import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  Future<void> addProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    log(productId);
    FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.tojson());
  }

  Future<void> editProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.tojson(), SetOptions(merge: true));
  }

  Future<List<ProductItemModel>> fetchTraderProductsOnly() async {
    List<ProductItemModel> productItemModelList = [];
    var response = await FirebaseFirestore.instance
        .collection(kShopCollection)
        .where(
          kTraderId,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .get();
    for (var doc in response.docs) {
      productItemModelList.add(ProductItemModel.fromJson(doc.data()));
    }
    return productItemModelList;
  }
}

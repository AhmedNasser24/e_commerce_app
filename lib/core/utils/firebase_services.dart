import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseServices {
  Future<void> addProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    // productItemModel.category =
    //     __handleProductCategoryBeforePush(productItemModel);
    await FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.tojson());
  }

  Future<void> editProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    // productItemModel.category =
    //     __handleProductCategoryBeforePush(productItemModel);
    await FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.tojson(), SetOptions(merge: true));
  }

  

  Future<List<ProductItemModel>> fetchCategoryProductsForTrader(
      {required String category}) async {
    List<ProductItemModel> productItemModelList = [];
    List<String> categoryInEngOrArbLangList =
        __getCategoryKeyCorrectly(category);
    late QuerySnapshot<Map<String, dynamic>> response;
    if (listEquals(categoryInEngOrArbLangList , [kAllCategory, "الكل"])) {
      response = await __getAllProduct();
    } else {
      response = await __getCategoriezedProduct(categoryInEngOrArbLangList);
    }
    for (var doc in response.docs) {
      productItemModelList.add(ProductItemModel.fromJson(doc.data()));
    }
    return productItemModelList;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> __getAllProduct() async {
    return await FirebaseFirestore.instance.collection(kShopCollection).where(
        kTraderId,
        isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        ).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> __getCategoriezedProduct(
      List<String> categoryInEngOrArbLangList) async {
    return await FirebaseFirestore.instance
        .collection(kShopCollection)
        .where(
          kTraderId,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .where(
          kProductCategory,
          whereIn: categoryInEngOrArbLangList,
        )
        .get();
  }

  List<String> __getCategoryKeyCorrectly(String category) {
    if (category == kElectronicsCategory || category == "الكترونيات") {
      return [kElectronicsCategory, "الكترونيات"];
    } else if (category == kClothesCategory || category == "الملابس") {
      return [kClothesCategory, "الملابس"];
    } else if (category == kShoesCategory || category == "الأحذية") {
      return [kShoesCategory, "الأحذية"];
    } else if (category == kJewellaryCategory || category == "المجوهرات") {
      return [kJewellaryCategory, "المجوهرات"];
    } else {
      return [kAllCategory, "الكل"];
    }
  }

  // String __handleProductCategoryBeforePush(ProductItemModel productItemModel) {
  //   if (productItemModel.category == kElectronicsCategory ||
  //       productItemModel.category == "الكترونيات") {
  //     return kElectronicsCategory;
  //   } else if (productItemModel.category == kClothesCategory ||
  //       productItemModel.category == "الملابس") {
  //     return kClothesCategory;
  //   } else if (productItemModel.category == kShoesCategory ||
  //       productItemModel.category == "الأحذية") {
  //     return kShoesCategory;
  //   } else if (productItemModel.category == kJewellaryCategory ||
  //       productItemModel.category == "المجوهرات") {
  //     return kJewellaryCategory;
  //   }
  //   return 'Others';
  // }
}

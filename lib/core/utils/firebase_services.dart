import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../features/customer/data/models/cart_item_model.dart';

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
    if (listEquals(categoryInEngOrArbLangList, [kAllCategory, "الكل"])) {
      response = await __getAllProductForTrader();
    } else {
      response =
          await __getCategoriezedProductForTrader(categoryInEngOrArbLangList);
    }
    for (var doc in response.docs) {
      productItemModelList.add(ProductItemModel.fromJson(doc.data()));
    }
    return productItemModelList;
  }

  Future<List<ProductItemModel>> fetchCategoryProductsForCustomer(
      {required String category}) async {
    List<ProductItemModel> productItemModelList = [];
    List<String> categoryInEngOrArbLangList =
        __getCategoryKeyCorrectly(category);
    late QuerySnapshot<Map<String, dynamic>> response;
    if (listEquals(categoryInEngOrArbLangList, [kAllCategory, "الكل"])) {
      response = await __getAllProductForCustomer();
    } else {
      response =
          await __getCategoriezedProductForCustomer(categoryInEngOrArbLangList);
    }
    for (var doc in response.docs) {
      productItemModelList.add(ProductItemModel.fromJson(doc.data()));
    }
    return productItemModelList;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> __getAllProductForTrader() async {
    return await FirebaseFirestore.instance
        .collection(kShopCollection)
        .where(
          kTraderId,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>> __getCategoriezedProductForTrader(
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

  Future<QuerySnapshot<Map<String, dynamic>>>
      __getAllProductForCustomer() async {
    return await FirebaseFirestore.instance.collection(kShopCollection).get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>
      __getCategoriezedProductForCustomer(
          List<String> categoryInEngOrArbLangList) async {
    return await FirebaseFirestore.instance
        .collection(kShopCollection)
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

  Future<void> addToCart({required CartItemModel addToCartModel}) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kCartDocOrCollection)
        .collection(kCartDocOrCollection)
        .doc()
        .set(addToCartModel.toJson());
  }

  Future<List<CartItemModel>> fetchCartItems() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    List<CartItemModel> addToCartModelList = [];
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kCartDocOrCollection)
        .collection(kCartDocOrCollection)
        .orderBy(kAddToCartDateKey, descending: true)
        .get();
    for (var doc in response.docs) {
      addToCartModelList.add(CartItemModel.fromJson(doc.data()));
    }
    return addToCartModelList;
  }
}

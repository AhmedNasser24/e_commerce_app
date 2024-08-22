import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import '../../features/auth/data/models/register_model.dart';
import '../../features/customer/data/models/cart_item_model.dart';

class FirebaseServices {
  Future<void> addProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    // productItemModel.category =
    //     __handleProductCategoryBeforePush(productItemModel);
    await FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.toJson());
  }

  Future<void> editProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    // productItemModel.category =
    //     __handleProductCategoryBeforePush(productItemModel);
    await FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.toJson(), SetOptions(merge: true));
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

  Future<void> addToCart({required CartItemModel cartItemModel}) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String orderId = cartItemModel.orderId;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kCartDocOrCollection)
        .collection(kCartDocOrCollection)
        .doc(orderId)
        .set(cartItemModel.toJson());
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

  Future<void> removeProductFromCart(
      {required CartItemModel cartItemModel}) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    String orderId = cartItemModel.orderId;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kCartDocOrCollection)
        .collection(kCartDocOrCollection)
        .doc(orderId)
        .delete();
  }

  Future<void> buyProduct( {required List<CartItemModel> cartItemModelList}) async {
    await __sendOrderToTrader(cartItemModelList: cartItemModelList);
    await __removeAllProductFromCart(cartItemModelList);
  }

  Future<void> __removeAllProductFromCart(
      List<CartItemModel> cartItemModelList) async {
    for (var cartItemModel in cartItemModelList) {
      await removeProductFromCart(cartItemModel: cartItemModel);
    }
  }

  // ignore: unused_element
  Future<void> __sendOrderToTrader(
      {required List<CartItemModel> cartItemModelList}) async {
    UserInfoModel userInfo = await __getUserInfoModel();

    List<ProductItemModel> productItemModelList = [];
    for (var cartItemModel in cartItemModelList) {
      productItemModelList.add(cartItemModel.productItemModel);
    }

    BuyProductModel buyProductModel = BuyProductModel(
      productItemModelList: productItemModelList,
      userInfoModel: userInfo,
      orderId: Random().nextDouble().toString(),
      buyingDate: DateTime.now().toString(),
    );

    await __sendOrder(buyProductModel);
  }

  Future<void> __sendOrder(BuyProductModel buyProductModel) async {
    String traderId = buyProductModel.productItemModelList[0].traderId!;
    String orderId = buyProductModel.orderId;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(traderId)
        .collection(kTraderCollection)
        .doc(kTraderNewOrderCollectionAndDoc)
        .collection(kTraderNewOrderCollectionAndDoc)
        .doc(orderId)
        .set(buyProductModel.toJson());
  }

  Future<UserInfoModel> __getUserInfoModel() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    var response = await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kCustomerInfoDoc)
        .get();
    return UserInfoModel.fromJson(response.data()!);
  }
}

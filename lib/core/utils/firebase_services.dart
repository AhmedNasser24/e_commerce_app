import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/customer/data/models/my_order_item_model.dart';
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
  Future<void> deleteProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    
    await FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .delete();
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
        .orderBy(kCreatedAt, descending: true)
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

  Future<void> removeAllProductFromCart(
      {required List<CartItemModel> cartItemModelList}) async {
    for (int i = 0; i < cartItemModelList.length; i++) {
      removeProductFromCart(cartItemModel: cartItemModelList[i]);
    }
  }

  Future<void> buyProduct(
      {required List<CartItemModel> cartItemModelList}) async {
    await __sendOrderToTrader(cartItemModelList: cartItemModelList);
    await __addToMyOrder(cartItemModelList: cartItemModelList) ;
    await removeAllProductFromCart(cartItemModelList: cartItemModelList);
  }

  Future<List<BuyProductModel>> fetchNewOrdersforTrader() async {
    String traderId = FirebaseAuth.instance.currentUser!.uid;
    var response = await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(traderId)
        .collection(kTraderCollection)
        .doc(kTraderNewOrderCollectionAndDoc)
        .collection(kTraderNewOrderCollectionAndDoc)
        .orderBy(kBuyingDateKey, descending: true)
        .get();

    List<BuyProductModel> buyProductModelList = [];
    for (var doc in response.docs) {
      buyProductModelList.add(BuyProductModel.fromJson(doc.data()));
    }
    return buyProductModelList;
  }

  Future<void> changeOrderFromNewToOld(
      {required BuyProductModel buyProductModel}) async {
    buyProductModel.isNew = false;
    String traderId = FirebaseAuth.instance.currentUser!.uid;
    String orderId = buyProductModel.orderId;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(traderId)
        .collection(kTraderCollection)
        .doc(kTraderNewOrderCollectionAndDoc)
        .collection(kTraderNewOrderCollectionAndDoc)
        .doc(orderId)
        .set(buyProductModel.toJson(), SetOptions(merge: true));
  }

  Future<void> changeOrderFromNotDeliveredToDelivered(
      {required BuyProductModel buyProductModel}) async {
    await __updateOrderFromNotDeliveredToDelivered(buyProductModel);
    await __removeitemsFromMyOrdersForCustomer(buyProductModel: buyProductModel) ;
  }

  Future<void> __updateOrderFromNotDeliveredToDelivered(BuyProductModel buyProductModel) async {
    buyProductModel.isDelivered = true;
    String traderId = FirebaseAuth.instance.currentUser!.uid;
    String orderId = buyProductModel.orderId;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(traderId)
        .collection(kTraderCollection)
        .doc(kTraderNewOrderCollectionAndDoc)
        .collection(kTraderNewOrderCollectionAndDoc)
        .doc(orderId)
        .set(buyProductModel.toJson(), SetOptions(merge: true));
  }

  // ignore: unused_element
  Future<void> __sendOrderToTrader(
      {required List<CartItemModel> cartItemModelList}) async {
    UserInfoModel? userInfo = await getCustomerInfoModel();

    List<ProductItemModel> productItemModelList = [];
    for (var cartItemModel in cartItemModelList) {
      productItemModelList.add(cartItemModel.productItemModel);
    }
    String customerId = FirebaseAuth.instance.currentUser!.uid;
    BuyProductModel buyProductModel = BuyProductModel(
      productItemModelList: productItemModelList,
      userInfoModel: userInfo!,
      orderId: Random().nextDouble().toString(),
      buyingDate: DateTime.now().toString(),
      customerId: customerId ,
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

  Future<UserInfoModel?> getCustomerInfoModel() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    var response = await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kCustomerInfoDoc)
        .get();
    if (response.data() == null) {
      return null;
    }
    return UserInfoModel.fromJson(response.data());
  }

  Future<UserInfoModel?> getTraderInfoModel() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    var response = await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kTraderCollection)
        .doc(kTraderInfoDoc)
        .get();
    if (response.data() == null) {
      return null;
    }
    return UserInfoModel.fromJson(response.data());
  }

  Future<void> setTraderInfoIntoFireStore(UserInfoModel registerModel) async {
    String traderUidDoc = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(traderUidDoc)
        .collection(kTraderCollection)
        .doc(kTraderInfoDoc)
        .set(registerModel.toJson());
  }

  Future<void> setCustomerInfoIntoFireStore(UserInfoModel registerModel) async {
    String customerUidDoc = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection(kUsersCollection)
        .doc(customerUidDoc)
        .collection(kCustomerCollection)
        .doc(kCustomerInfoDoc)
        .set(registerModel.toJson());
  }

  Future<List<MyOrderItemModel>> fetchMyOrderItems() async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    List<MyOrderItemModel> myOrderItemModelList = [];
    QuerySnapshot<Map<String, dynamic>> response = await FirebaseFirestore
        .instance
        .collection(kUsersCollection)
        .doc(userId)
        .collection(kCustomerCollection)
        .doc(kMyOrdersDocOrCollection)
        .collection(kMyOrdersDocOrCollection)
        .orderBy(kMyOrderDate, descending: true)
        .get();
    for (var doc in response.docs) {
      myOrderItemModelList.add(MyOrderItemModel.fromJson(doc.data()));
    }

    return myOrderItemModelList;
  }

  Future<void> __addToMyOrder(
      {required List<CartItemModel> cartItemModelList}) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    for (var cartItemModel in cartItemModelList) {
      String productId = cartItemModel.productItemModel.productId!;
      MyOrderItemModel myOrderItemModel = MyOrderItemModel(
        cartItemModel: cartItemModel,
        myOrderDate: DateTime.now().toString(),
      );
      await FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(userId)
          .collection(kCustomerCollection)
          .doc(kMyOrdersDocOrCollection)
          .collection(kMyOrdersDocOrCollection)
          .doc(productId)
          .set(myOrderItemModel.toJson());
    }
  }

  Future<void> __removeitemsFromMyOrdersForCustomer(
      {required BuyProductModel buyProductModel}) async {
    String userId = buyProductModel.customerId;
    for (var productItemModel in buyProductModel.productItemModelList) {
      String productId = productItemModel.productId!;
      await FirebaseFirestore.instance
          .collection(kUsersCollection)
          .doc(userId)
          .collection(kCustomerCollection)
          .doc(kMyOrdersDocOrCollection)
          .collection(kMyOrdersDocOrCollection)
          .doc(productId)
          .delete();
    }
  }
}

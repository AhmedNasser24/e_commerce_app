import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseServices {
  Future<void> addProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    productItemModel.category =
        __handleProductCategoryBeforePush(productItemModel);
    await FirebaseFirestore.instance
        .collection(kShopCollection)
        .doc(productId)
        .set(productItemModel.tojson());
  }

  Future<void> editProduct(ProductItemModel productItemModel) async {
    String productId = productItemModel.productId!;
    productItemModel.category =
        __handleProductCategoryBeforePush(productItemModel);
    await FirebaseFirestore.instance
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

  Future<List<ProductItemModel>> fetchCategoryProductsForTrader(
      {required String category}) async {
    List<ProductItemModel> productItemModelList = [];
    category = __getCategoryKeyCorrectly(category);
    var response = await FirebaseFirestore.instance
        .collection(kShopCollection)
        .where(
          kTraderId,
          isEqualTo: FirebaseAuth.instance.currentUser!.uid,
        )
        .where(
          kProductCategory,
          isEqualTo: category,
        )
        .get();
    for (var doc in response.docs) {
      productItemModelList.add(ProductItemModel.fromJson(doc.data()));
    }
    return productItemModelList;
  }

  String __getCategoryKeyCorrectly(String category) {
    if (category == kElectronicsCategory || category == "الكترونيات") {
      return kElectronicsCategory;
    } else if (category == kClothesCategory || category == "الملابس") {
      return kClothesCategory;
    } else if (category == kShoesCategory || category == "الأحذية") {
      return kShoesCategory;
    } else if (category == kJewellaryCategory || category == "المجوهرات") {
      return kJewellaryCategory;
    } else {
      return 'Others';
    }
  }

  String __handleProductCategoryBeforePush(ProductItemModel productItemModel) {
    if (productItemModel.category == kElectronicsCategory ||
        productItemModel.category == "الكترونيات") {
      return kElectronicsCategory;
    } else if (productItemModel.category == kClothesCategory ||
        productItemModel.category == "الملابس") {
      return kClothesCategory;
    } else if (productItemModel.category == kShoesCategory ||
        productItemModel.category == "الأحذية") {
      return kShoesCategory;
    } else if (productItemModel.category == kJewellaryCategory ||
        productItemModel.category == "المجوهرات") {
      return kJewellaryCategory;
    }
    return 'Others';
  }
}

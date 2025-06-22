import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/customer/data/models/cart_item_model.dart';

import '../../features/customer/data/models/buy_product_model.dart';
import '../../features/customer/data/models/my_order_item_model.dart';
import '../models/product_item_model.dart';

abstract class DatabaseServices {
  Future<void> addProduct(ProductItemModel productItemModel);
  Future<void> editProduct(ProductItemModel productItemModel);
  Future<void> deleteProduct(ProductItemModel productItemModel);
  Future<void> addToCart({required CartItemModel cartItemModel});
  Future<void> removeProductFromCart({required CartItemModel cartItemModel});
  Future<void> removeAllProductFromCart(
      {required List<CartItemModel> cartItemModelList});
  Future<void> buyProduct({required List<CartItemModel> cartItemModelList, required bool isPaid});

  Future<List<ProductItemModel>> fetchCategoryProductsForTrader(
      {required String category});
  Future<void> changeOrderFromNotDeliveredToDelivered(
      {required BuyProductModel buyProductModel});


  Future<List<ProductItemModel>> fetchCategoryProductsForCustomer(
      {required String category});
  
  Future<List<CartItemModel>> fetchCartItems();
  Future<List<MyOrderItemModel>> fetchMyOrderItems();
  Future<List<BuyProductModel>> fetchNewOrdersforTrader();
  Future<void> changeOrderFromNewToOld(
      {required BuyProductModel buyProductModel});
  Future<void> setTraderInfoIntoFireStore(UserInfoModel registerModel);
  Future<void> setCustomerInfoIntoFireStore(UserInfoModel registerModel);
  Future<UserInfoModel> getUserInfoModel();
}

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/data/models/cart_item_model.dart';

class MyOrderItemModel {
  final String myOrderDate ;
  final CartItemModel cartItemModel;

  MyOrderItemModel({
    required this.myOrderDate,
    required this.cartItemModel,
  });

  factory MyOrderItemModel.fromJson(Map<String, dynamic> json) {
    return MyOrderItemModel(
      myOrderDate: json[kMyOrderDate],
      cartItemModel: CartItemModel.fromJson(json[kCartItemModelKey]),
    );
  }

  toJson(){
    return {
      kMyOrderDate : myOrderDate,
      kCartItemModelKey : cartItemModel.toJson(),
    };
  }
}
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';

class CartItemModel {
  final ProductItemModel productItemModel ;
  final String addToCartDate ;
  final String orderId ;

  CartItemModel( {
    required this.productItemModel,
    required this.addToCartDate,
    required this.orderId,
  });

  toJson(){
    return {
      kProductInfoKey : productItemModel.tojson(),
      kAddToCartDateKey : addToCartDate,
      kOrderIdKey : orderId,
    };
  }

  factory CartItemModel.fromJson(json){
    return CartItemModel(
      productItemModel: ProductItemModel.fromJson(json[kProductInfoKey]),
      addToCartDate: json[kAddToCartDateKey],
      orderId: json[kOrderIdKey],
    );
  }
}
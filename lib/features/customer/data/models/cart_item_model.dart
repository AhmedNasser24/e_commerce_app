import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';

class CartItemModel {
  final ProductItemModel productItemModel ;
  final String addToCartDate ;

  CartItemModel({
    required this.productItemModel,
    required this.addToCartDate,
  });

  toJson(){
    return {
      kProductInfoKey : productItemModel.tojson(),
      kAddToCartDateKey : addToCartDate,
    };
  }

  factory CartItemModel.fromJson(json){
    return CartItemModel(
      productItemModel: ProductItemModel.fromJson(json[kProductInfoKey]),
      addToCartDate: json[kAddToCartDateKey],
    );
  }
}
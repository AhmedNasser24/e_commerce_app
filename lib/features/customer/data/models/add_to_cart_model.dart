import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';

class AddToCartModel {
  final ProductItemModel productItemModel ;
  final String addToCartDate ;

  AddToCartModel({
    required this.productItemModel,
    required this.addToCartDate,
  });

  toJson(){
    return {
      kProductInfoKey : productItemModel.tojson(),
      kAddToCartDateKey : addToCartDate,
    };
  }

  factory AddToCartModel.fromJson(json){
    return AddToCartModel(
      productItemModel: ProductItemModel.fromJson(json[kProductInfoKey]),
      addToCartDate: json[kAddToCartDateKey],
    );
  }
}
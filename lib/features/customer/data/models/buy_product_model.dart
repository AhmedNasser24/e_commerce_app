import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';

class BuyProductModel {
  final ProductItemModel productItemModel ;
  final UserInfoModel userInfoModel;
  final String orderId ;
  final String buyingDate ;
  BuyProductModel({
    required this.productItemModel,
    required this.userInfoModel,
    required this.orderId,
    required this.buyingDate,
  });

  toJson(){
    return {
      kProductInfoKey : productItemModel.toJson(),
      kUserInfoKey : userInfoModel.toJson(),
      kOrderIdKey : orderId,
      kBuyingDateKey : buyingDate,
    };
  }

  factory BuyProductModel.fromJson( json){
    return BuyProductModel(
      productItemModel: ProductItemModel.fromJson(json[kProductInfoKey]),
      userInfoModel: UserInfoModel.fromJson(json[kUserInfoKey]),
      orderId: json[kOrderIdKey],
      buyingDate: json[kBuyingDateKey],
    );
  }
}
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';

class BuyProductModel {
  final List < ProductItemModel > productItemModelList ;
  final UserInfoModel userInfoModel;
  final String orderId ;
  final String buyingDate ;
  BuyProductModel({
    required this.productItemModelList,
    required this.userInfoModel,
    required this.orderId,
    required this.buyingDate,
  });

  toJson(){
    List < Map<String , dynamic> > productItemMapList = [];
    for (int i = 0 ; i < productItemModelList.length ; i++){
      productItemMapList.add(productItemModelList[i].toJson());
    } 
    return {
      kProductInfoListKey : productItemMapList,
      kUserInfoKey : userInfoModel.toJson(),
      kOrderIdKey : orderId,
      kBuyingDateKey : buyingDate,
    };
  }

  factory BuyProductModel.fromJson( json){
    List < ProductItemModel > productItemModelList = [];
    for (int i = 0 ; i < json[kProductInfoListKey].length ; i++){
      productItemModelList.add(ProductItemModel.fromJson(json[kProductInfoListKey][i]));
    }
    return BuyProductModel(
      productItemModelList: productItemModelList,
      userInfoModel: UserInfoModel.fromJson(json[kUserInfoKey]),
      orderId: json[kOrderIdKey],
      buyingDate: json[kBuyingDateKey],
    );
  }
}
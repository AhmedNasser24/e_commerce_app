import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';

class BuyProductModel {
  final List < ProductItemModel > productItemModelList ;
  final UserInfoModel userInfoModel;
  final String orderId ;
  final String buyingDate ;
  final String customerId ;
  bool isDelivered ;
  bool isNew ;
  BuyProductModel( {
    required this.productItemModelList,
    required this.userInfoModel,
    required this.orderId,
    required this.buyingDate,
    required this.customerId,
    this.isNew = true,
    this.isDelivered = false,
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
      kIsNewKey : isNew ,
      kIsDelivered : isDelivered,
      kCustomerIdKey : customerId,
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
      customerId: json[kCustomerIdKey],
      isNew: json[kIsNewKey] ,
      isDelivered: json[kIsDelivered] ?? false,
    );
  }
}
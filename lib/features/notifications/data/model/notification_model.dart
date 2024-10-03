import 'package:e_commerce/core/models/product_item_model.dart';

class NotificationModel {
  String? title , body , token , accessToken;
  ProductItemModel? productItemModel ;

  NotificationModel({
    this.title,
    this.body,
    this.token,
    this.accessToken,
    this.productItemModel,
  });
}
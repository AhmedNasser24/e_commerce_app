import 'package:e_commerce/constants.dart';

class ProductItemModel {
  String? productId, name, category, price, imageUrl, traderId;
  int? quantity;
  String? createAt;
  ProductItemModel(
      {this.createAt,
      this.productId,
      this.name,
      this.category,
      this.price,
      this.imageUrl,
      this.traderId,
      this.quantity,
      });

  Map<String, dynamic> toJson() {
    return {
      kProductId: productId,
      kProductName: name,
      kProductCategory: category,
      kProductPrice: price,
      kProductImageUrl: imageUrl,
      kProductQuantity: quantity,
      kTraderId: traderId,
      kCreatedAt: createAt,
    };
  }

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      productId: json[kProductId],
      name: json[kProductName],
      category: json[kProductCategory],
      price: json[kProductPrice],
      imageUrl: json[kProductImageUrl],
      traderId: json[kTraderId],
      quantity: json[kProductQuantity],
      createAt: json[kCreatedAt],
    );
  }
}

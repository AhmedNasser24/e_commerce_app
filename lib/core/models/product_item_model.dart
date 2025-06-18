import 'dart:io';

import 'package:e_commerce/constants.dart';

class ProductItemModel {
  String? productId, desc, name, category, price,  traderId;
  String? imageUrl, imagePath , imageBucket;
  File? imageFile;
  int? quantity;
  String? createAt;
  String? discount ;
  ProductItemModel(
      {this.createAt,
      this.productId,
      this.name,
      this.category,
      this.price,
      this.imageUrl,
      this.imageFile,
      this.traderId,
      this.quantity,
      this.desc,
      this.imagePath,
      this.imageBucket,
      this.discount = "50"
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
      kProductDescription: desc,
      kProductImagePath: imagePath,
      kProductImageBucket: imageBucket,
      kProductImageFile:  imageFile!.path,
    };
  }

  factory ProductItemModel.fromJson(Map<String, dynamic> json) {
    return ProductItemModel(
      productId: json[kProductId],
      name: json[kProductName],
      category: json[kProductCategory],
      price: json[kProductPrice],
      imageUrl: json[kProductImageUrl],
      imagePath: json[kProductImagePath],
      imageBucket: json[kProductImageBucket],
      traderId: json[kTraderId],
      quantity: json[kProductQuantity],
      createAt: json[kCreatedAt],
      desc: json[kProductDescription],
      imageFile: json[kProductImageFile] == null ? null : File(json[kProductImageFile]),
    );
  }
}

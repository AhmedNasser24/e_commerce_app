import 'dart:math';

import 'package:e_commerce/constants.dart';

class ProductItemModel {
  String? productId , name , category , price , imageUrl , traderId ;
  int? quantity ;
  String? dateOfBuying ;
  ProductItemModel({ this.dateOfBuying ,this.productId , this.name , this.category , this.price , this.imageUrl , this.traderId , this.quantity});

  Map < String , dynamic> tojson(){
    return {
      kProductId : productId,
      kProductName : name ,
      kProductCategory : category ,
      kProductPrice : price ,
      kProductImageUrl : imageUrl ,
      kProductQuantity : quantity ,
      kTraderId :traderId ,
      kDateOfBuying : dateOfBuying ,
    };
  }
}
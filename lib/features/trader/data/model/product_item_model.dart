import 'dart:math';

import 'package:e_commerce/constants.dart';

class ProductItemModel {
  String? id , name , category , price , imageUrl , traderId ;
  int? quantity ;
  DateTime? dateOfBuying ;
  ProductItemModel({ this.dateOfBuying ,this.id , this.name , this.category , this.price , this.imageUrl , this.traderId , this.quantity});

  Map < String , dynamic> tojson(){
    return {
      kProductId : Random().nextInt(1e9.toInt()).toString(),
      kProductName : name ,
      kProductCategory : category ,
      kProductPrice : price ,
      kProductImageUrl : imageUrl ,
      kProductQuantity : quantity ,
      kTraderId : traderId ,
      kDateOfBuying : DateTime.now() ,
    };
  }
}
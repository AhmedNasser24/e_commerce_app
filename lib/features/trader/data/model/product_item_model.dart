import 'package:e_commerce/constants.dart';

class ProductItemModel {
  String? id , name , category , price , imageUrl , traderId ;
  int? quantity ;

  ProductItemModel({this.id , this.name , this.category , this.price , this.imageUrl , this.traderId , this.quantity});

  Map < String , dynamic> tojson(){
    return {
      kProductId : id,
      kProductName : name ,
      kProductCategory : category ,
      kProductPrice : price ,
      kProductImageUrl : imageUrl ,
      kProductQuantity : quantity ,
      kTraderId : traderId ,
    };
  }
}
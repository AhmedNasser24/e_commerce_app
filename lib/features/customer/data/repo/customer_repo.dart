import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/product_item_model.dart';
import '../models/cart_item_model.dart';

abstract class CustomerRepo {
  Future<Either<List<ProductItemModel>, Failure>> fetchCategoryProductsForCustomer({required String category});

  Future <Either<void, Failure>> addToCart({required CartItemModel cartItemModel});
  Future <Either<void, Failure>> removeProductFromCart({required CartItemModel cartItemModel});
  Future <Either<void, Failure>> removeAllProductFromCart({required List <CartItemModel> cartItemModelList});
  Future< Either <List<CartItemModel> , Failure >> fetchCartItems() ;
  Future <Either < void , Failure >> buyProduct({required List<CartItemModel> cartItemModelList}) ;
}

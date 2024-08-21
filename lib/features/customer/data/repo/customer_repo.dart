import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/cart_item_model.dart';

abstract class CustomerRepo {
  Future <Either<void, Failure>> addToCart({required CartItemModel cartItemModel});
  Future <Either<void, Failure>> removeProductFromCart({required CartItemModel cartItemModel});
  Future< Either <List<CartItemModel> , Failure >> fetchCartItems() ;
}

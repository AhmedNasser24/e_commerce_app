import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/add_to_cart_model.dart';

abstract class CustomerRepo {
  Future <Either<void, Failure>> addToCart({required AddToCartModel addToCartModel});
}

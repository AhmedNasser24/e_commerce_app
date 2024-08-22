import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/models/product_item_model.dart';

import '../../../customer/data/models/buy_product_model.dart';

abstract class TraderRepo {
  Future<Either<void, Failure>> addProduct({required ProductItemModel productItemModel});
  Future<Either<void, Failure>> editProduct({required ProductItemModel productItemModel});
  Future<Either<List<ProductItemModel>, Failure>> fetchCategoryProductsForTrader({required String category});
  Future < Either < List < BuyProductModel > , Failure >> fetchNewOrdersforTrader(); 
}

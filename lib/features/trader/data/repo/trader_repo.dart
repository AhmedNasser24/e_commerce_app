import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/trader/data/model/product_item_model.dart';

abstract class TraderRepo {
  Future <Either < void , Failure >> addProduct({required ProductItemModel productItemModel}) ;
  Future <Either < void , Failure >> editProduct({required ProductItemModel productItemModel}) ;
}
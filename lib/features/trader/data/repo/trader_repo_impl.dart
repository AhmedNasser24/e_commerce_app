import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/firebase_services.dart';

import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:firebase_core/firebase_core.dart';

import 'trader_repo.dart';

class TraderRepoImpl extends TraderRepo {
  @override
  Future<Either<void, Failure>> addProduct(
      {required ProductItemModel productItemModel}) async {
    try {
      await FirebaseServices().addProduct(productItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireStoreException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> editProduct(
      {required ProductItemModel productItemModel}) async {
    try {
      await FirebaseServices().editProduct(productItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireStoreException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<List<ProductItemModel>, Failure>>
      fetchTraderProductOnly() async {
    try {
      List<ProductItemModel> productItemModelList =
          await FirebaseServices().fetchTraderProductsOnly();
      return left(productItemModelList);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireStoreException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<List<ProductItemModel>, Failure>>
      fetchCategoryProductsForTrader({required String category}) async {
    try {
      List<ProductItemModel> productItemModelList =
          await FirebaseServices().fetchCategoryProductsForTrader(category: category);
      return left(productItemModelList);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireStoreException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }
}

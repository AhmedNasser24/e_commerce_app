import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';

import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/core/services/storage_services.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../../core/functions/has_network.dart';
import '../../../../core/services/database_services.dart';
import 'trader_repo.dart';

class TraderRepoImpl extends TraderRepo {
  final DatabaseServices dataBaseServices;
  final StorageServices storageServices;
  TraderRepoImpl(
      {required this.dataBaseServices, required this.storageServices});
  @override
  Future<Either<void, Failure>> addProduct(
      {required ProductItemModel productItemModel}) async {
    try {
      if (!await hasNetwork()) {
        return right(const Failure("لا يوجد اتصال بالانترنت"));
      }
      await storageServices.uploadFile(productItemModel);
      await dataBaseServices.addProduct(productItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> editProduct(
      {required ProductItemModel productItemModel}) async {
    try {
      if (!await hasNetwork()) {
        return right(const Failure("لا يوجد اتصال بالانترنت"));
      }
      if (productItemModel.imagePath != null &&
          productItemModel.imageBucket != null) {
        await storageServices.updateFile(productItemModel);
      }
      await dataBaseServices.editProduct(productItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> deleteProduct(
      {required ProductItemModel productItemModel}) async {
    try {
      if (!await hasNetwork()) {
        return right(const Failure("لا يوجد اتصال بالانترنت"));
      }
      if (productItemModel.imagePath != null &&
          productItemModel.imageBucket != null) {
        await storageServices.deleteFile(productItemModel.imagePath!);
      }
      await dataBaseServices.deleteProduct(productItemModel);
      return left(null);
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<List<ProductItemModel>, Failure>>
      fetchCategoryProductsForTrader({required String category}) async {
    try {
      List<ProductItemModel> productItemModelList = await dataBaseServices
          .fetchCategoryProductsForTrader(category: category);
      return left(productItemModelList);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<List<BuyProductModel>, Failure>>
      fetchNewOrdersforTrader() async {
    try {
      List<BuyProductModel> buyProductModelList =
          await dataBaseServices.fetchNewOrdersforTrader();
      return left(buyProductModelList);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> changeOrderFromNewToOld(
      {required BuyProductModel buyProductModel}) async {
    try {
      await dataBaseServices.changeOrderFromNewToOld(
          buyProductModel: buyProductModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> changeOrderFromNotDeliveredToDelivered(
      {required BuyProductModel buyProductModel}) async {
    try {
      await dataBaseServices.changeOrderFromNotDeliveredToDelivered(
          buyProductModel: buyProductModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure(e.toString()));
    }
  }
}

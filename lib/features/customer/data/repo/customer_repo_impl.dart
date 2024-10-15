import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/firebase_services.dart';
import 'package:e_commerce/features/customer/data/models/my_order_item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


import '../../../../core/functions/has_network.dart';
import '../../../../core/models/product_item_model.dart';
import '../models/cart_item_model.dart';
import 'customer_repo.dart';

class CustomerRepoImpl extends CustomerRepo {

   @override
  Future<Either<List<ProductItemModel>, Failure>>
      fetchCategoryProductsForCustomer({required String category}) async {
    try {
      List<ProductItemModel> productItemModelList = await FirebaseServices()
          .fetchCategoryProductsForCustomer(category: category);
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
  Future <Either<void, Failure>> addToCart(
      {required CartItemModel cartItemModel}) async {
    try {
      if (!await hasNetwork()) {
        return right(const Failure("No Internet Connection"));
      }
      await FirebaseServices().addToCart(cartItemModel: cartItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e) ) ;
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }
  
  @override
  Future<Either<List<CartItemModel>, Failure>> fetchCartItems() async{
    try {
      List<CartItemModel> cartItemList = await FirebaseServices().fetchCartItems();
      return left(cartItemList);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e) ) ;
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }

   @override
  Future<Either<List<MyOrderItemModel>, Failure>> fetchMyOrderItems() async{
    try {
      List<MyOrderItemModel> myOrderItemList = await FirebaseServices().fetchMyOrderItems();
      return left(myOrderItemList);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e) ) ;
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }
  
  @override
  Future<Either<void, Failure>> removeProductFromCart({required CartItemModel cartItemModel}) async{
    try {
      if (!await hasNetwork()) {
        return right(const Failure("No Internet Connection"));
      }
      await FirebaseServices().removeProductFromCart(cartItemModel: cartItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e) ) ;
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }

  
  @override
  Future<Either<void, Failure>> removeAllProductFromCart({required List <CartItemModel> cartItemModelList}) async{
    try {
      if (!await hasNetwork()) {
        return right(const Failure("No Internet Connection"));
      }
      await FirebaseServices().removeAllProductFromCart(cartItemModelList: cartItemModelList);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e) ) ;
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }
  
  @override
  Future<Either<void, Failure>> buyProduct({required List<CartItemModel> cartItemModelList}) async{
    try {
      if (!await hasNetwork()) {
        return right(const Failure("No Internet Connection"));
      }
      await FirebaseServices().buyProduct(cartItemModelList: cartItemModelList);
      return left(null);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e) ) ;
    } 
    on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }
}

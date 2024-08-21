import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/firebase_services.dart';


import '../models/cart_item_model.dart';
import 'customer_repo.dart';

class CustomerRepoImpl extends CustomerRepo {
  @override
  Future <Either<void, Failure>> addToCart(
      {required CartItemModel cartItemModel}) async {
    try {
      await FirebaseServices().addToCart(cartItemModel: cartItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireStoreException(e) ) ;
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
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
      return right(FireBaseFailure.fromFireStoreException(e) ) ;
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }
  
  @override
  Future<Either<void, Failure>> removeProductFromCart({required CartItemModel cartItemModel}) async{
    try {
      await FirebaseServices().removeProductFromCart(cartItemModel: cartItemModel);
      return left(null);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireStoreException(e) ) ;
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    }catch (e) {
      return right(Failure(e.toString())) ;
    }
  }
}

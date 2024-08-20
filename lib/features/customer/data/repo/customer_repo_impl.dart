import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/firebase_services.dart';

import 'package:e_commerce/features/customer/data/models/add_to_cart_model.dart';

import 'customer_repo.dart';

class CustomerRepoImpl extends CustomerRepo {
  @override
  Future <Either<void, Failure>> addToCart(
      {required AddToCartModel addToCartModel}) async {
    try {
      await FirebaseServices().addToCart(addToCartModel: addToCartModel);
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

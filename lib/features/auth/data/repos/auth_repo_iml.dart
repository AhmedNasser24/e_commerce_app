// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/data/models/login_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/firebase_services.dart';

class AuthRepoIml extends AuthRepo {
  @override
  Future<Either<void, Failure>> login({required LoginModel loginModel}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginModel.email!, password: loginModel.password!);
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FireBaseFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("login error : $e"));
    }
  }

  @override
  Future<Either<void, Failure>> register(
      {required UserInfoModel registerModel}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email!,
        password: registerModel.password!,
      );
      await credential.user!.sendEmailVerification();
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FireBaseFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("register error : $e"));
    }
  }
  @override
  Future<Either<void, Failure>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FireBaseFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(FireBaseFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("signOut error : $e"));
    }
  }

  @override
  Future<Either<UserInfoModel?, Failure>> getCustomerInfoModel() async {
    try {
      UserInfoModel? userInfoModel =
          await FirebaseServices().getCustomerInfoModel();
      return left(userInfoModel);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireBaseException(e));
    }catch (e){
      return right(Failure("getCustomerInfoModel error : $e"));
    }
  }

  @override
  Future<Either<UserInfoModel?, Failure>> gettraderInfoModel() async{
    try {
      UserInfoModel? userInfoModel =
          await FirebaseServices().getTraderInfoModel();
      return left(userInfoModel);
    } on FirebaseException catch (e) {
      return right(FireBaseFailure.fromFireBaseException(e));
    }catch (e){
      return right(Failure("getCustomerInfoModel error : $e"));
    }
  }
}

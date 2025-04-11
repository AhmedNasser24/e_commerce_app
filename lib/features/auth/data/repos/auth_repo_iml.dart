// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/services/auth_service.dart';
import 'package:e_commerce/features/auth/data/models/login_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/database_services.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/firestore_services.dart';

class AuthRepoIml extends AuthRepo {
  final AuthService authService = FirebaseAuthService();
  final DatabaseServices dataBaseServices = FireStoreServices();
  @override
  Future<Either<void, Failure>> login({required LoginModel loginModel}) async {
    try {
      await authService.login(loginModel);
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("login error : $e"));
    }
  }

  @override
  Future<Either<void, Failure>> register(
      {required UserInfoModel registerModel}) async {
    try {
      await authService.register(registerModel);
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("register error : $e"));
    }
  }

  @override
  Future<Either<void, Failure>> signOut() async {
    try {
      await authService.signOut();
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("signOut error : $e"));
    }
  }

  @override
  Future<Either<UserInfoModel, Failure>> getUserInfoModel() async {
    try {
      UserInfoModel userInfoModel =
          await dataBaseServices.getUserInfoModel();
      return left(userInfoModel);
    } on FirebaseException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } catch (e) {
      return right(Failure("getCustomerInfoModel error : $e"));
    }
  }

  @override
  Future<Either<void, Failure>> setTraderInfoIntoFireStore(
      UserInfoModel registerModel) async {
    try {
      await dataBaseServices.setTraderInfoIntoFireStore(registerModel);
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("setTraderInfoIntoFireStore error : $e"));
    }
  }

  @override
  Future<Either<void, Failure>> setCustomerInfoIntoFireStore(
      UserInfoModel registerModel) async {
    try {
      await dataBaseServices.setCustomerInfoIntoFireStore(registerModel);

      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      return right(ServerFailure.fromSocketException(e));
    } catch (e) {
      return right(Failure("setCustomerInfoIntoFireStore error : $e"));
    }
  }
}

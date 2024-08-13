// ignore_for_file: unused_local_variable

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/auth/data/models/login_model.dart';
import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/data/repos/auth_repo.dart';
import 'package:e_commerce/utils/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoIml extends AuthRepo {
  @override
  Future<Either<void, Failure>> login({required LoginModel loginModel}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: loginModel.email!, password: loginModel.password!);
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FireBaseFailure.fromAuthException(e));
    } catch (e) {
      return right(Failure("login error : $e"));
    }
  }

  @override
  Future<Either<void, Failure>> register(
      {required RegisterModel registerModel}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: registerModel.email!,
        password: registerModel.password!,
      );
      await credential.user!.sendEmailVerification();
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FireBaseFailure.fromAuthException(e));
    } catch (e) {
      return right(Failure("register error : $e"));
    }
  }

  Future<Either<void, Failure>> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return left(null);
    } on FirebaseAuthException catch (e) {
      return right(FireBaseFailure.fromAuthException(e));
    } catch (e) {
      return right(Failure("signOut error : $e"));
    }
  }
}

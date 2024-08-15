import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class FireBaseFailure extends Failure {
  const FireBaseFailure(super.errMessage);

  factory FireBaseFailure.fromAuthException(FirebaseAuthException e) {
    if (e.code == 'invalid-email') {
      debugPrint(e.code);
      return const FireBaseFailure(
          'Invalid email , email should be : email_name@*****.com');
    } else if (e.code == 'weak-password') {
      debugPrint(e.code);
      return const FireBaseFailure('The password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      debugPrint(e.code);
      return const FireBaseFailure('This email is already exist');
    } else if (e.code == 'network-request-failed') {
      debugPrint(e.code);
      return const FireBaseFailure('please check your internet connection');
    } else if (e.code == 'invalid-credential') {
      debugPrint(e.code);
      return const FireBaseFailure('Email Not Found');
    } else if (e.code == 'invalid-email') {
      debugPrint(e.code);
      return const FireBaseFailure('invalid email , email should be: email_name@*****.com');
    } else {
      debugPrint(e.code);
      return const FireBaseFailure('unknown input');
    }
  }
}

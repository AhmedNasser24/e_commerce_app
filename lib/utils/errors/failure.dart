import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Failure {
  final String errMessage;
  Failure(this.errMessage);
}

class FireBaseFailure extends Failure {
  FireBaseFailure(super.errMessage);

  factory FireBaseFailure.fromAuthException(FirebaseAuthException e) {
    if (e.code == 'invalid-email') {
      debugPrint(e.code);
      return (FireBaseFailure(
          'Invalid email , email should be : email_name@*****.com'));
    } else if (e.code == 'weak-password') {
      debugPrint(e.code);
      return (FireBaseFailure('The password provided is too weak'));
    } else if (e.code == 'email-already-in-use') {
      debugPrint(e.code);
      return (FireBaseFailure('This email is already exist'));
    } else if (e.code == 'network-request-failed') {
      debugPrint(e.code);
      return (FireBaseFailure('please check your internet connection'));
    } else {
      debugPrint(e.code);
      return (FireBaseFailure('unknown input'));
    }
  }
}

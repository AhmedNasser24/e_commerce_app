import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class FireBaseFailure extends Failure {
  const FireBaseFailure(super.errMessage);

  factory FireBaseFailure.fromFireBaseException(FirebaseException e) {
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
      return const FireBaseFailure(
          'invalid email , email should be: email_name@*****.com');
    } else if (e.code == 'permission-denied') {
      return const FireBaseFailure(
          'Permission denied. You do not have access to this resource.');
    } else if (e.code == 'unavailable') {
      return const FireBaseFailure(
          'Firestore service is currently unavailable.');
    } else if (e.code == 'not-found') {
      return const FireBaseFailure('Document not found.');
    } else if (e.code == 'object-not-found') {
      return const FireBaseFailure('No file found at the specified reference.');
    } else if (e.code == 'unauthenticated') {
      return const FireBaseFailure(
          'User is not authenticated. Please sign in and try again.');
    } else if (e.code == 'unauthorized') {
      return const FireBaseFailure(
          'User does not have permission to access this file.');
    } else if (e.code == 'quota-exceeded') {
      return const FireBaseFailure(
          'Quota exceeded. Please upgrade your Firebase plan.');
    } else {
      return FireBaseFailure('An error occurred: ${e.message}');
    }
  }

  factory FireBaseFailure.fromSocketException(SocketException e) {
    return const FireBaseFailure(
        'No internet connection. Please check your network and try again.');
  }
}

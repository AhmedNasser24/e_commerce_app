import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);

  factory ServerFailure.fromFireBaseException(FirebaseException e) {
    if (e.code == 'invalid-email') {
      debugPrint(e.code);
      return const ServerFailure(
          'Invalid email , email should be : email_name@*****.com');
    } else if (e.code == 'weak-password') {
      debugPrint(e.code);
      return const ServerFailure('The password provided is too weak');
    } else if (e.code == 'email-already-in-use') {
      debugPrint(e.code);
      return const ServerFailure('This email is already exist');
    } else if (e.code == 'network-request-failed') {
      debugPrint(e.code);
      return const ServerFailure('please check your internet connection');
    } else if (e.code == 'invalid-credential') {
      debugPrint(e.code);
      return const ServerFailure('Email Not Found');
    } else if (e.code == 'invalid-email') {
      debugPrint(e.code);
      return const ServerFailure(
          'invalid email , email should be: email_name@*****.com');
    } else if (e.code == 'permission-denied') {
      return const ServerFailure(
          'Permission denied. You do not have access to this resource.');
    } else if (e.code == 'unavailable') {
      return const ServerFailure(
          'Firestore service is currently unavailable.');
    } else if (e.code == 'not-found') {
      return const ServerFailure('Document not found.');
    } else if (e.code == 'object-not-found') {
      return const ServerFailure('No file found at the specified reference.');
    } else if (e.code == 'unauthenticated') {
      return const ServerFailure(
          'User is not authenticated. Please sign in and try again.');
    } else if (e.code == 'unauthorized') {
      return const ServerFailure(
          'User does not have permission to access this file.');
    } else if (e.code == 'quota-exceeded') {
      return const ServerFailure(
          'Quota exceeded. Please upgrade your Firebase plan.');
    } else {
      return ServerFailure('An error occurred: ${e.message}');
    }
  }

  factory ServerFailure.fromSocketException(SocketException e) {
    return const ServerFailure(
        'No internet connection. Please check your network and try again.');
  }

  factory ServerFailure.fromHttpClientException (ClientException e) {
    return  ServerFailure(
        "client error : $e");
  }
}

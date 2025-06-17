import 'dart:io';

import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:e_commerce/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Failure {
  final String errMessage;
  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  const ServerFailure(super.errMessage);
  static BuildContext context = navigatorKey.currentContext!;
  factory ServerFailure.fromFireBaseException(FirebaseException e) {
    debugPrint(e.code);

    if (e.code == 'network-request-failed') {
      return ServerFailure(
          AppLocalizations.of(context)!.no_internet_connection);
    } else if (e.code == 'invalid-email') {
      return ServerFailure(
        AppLocalizations.of(context)!.failure_invalid_email,
      );
    } else if (e.code == 'weak-password') {
      return ServerFailure(
          AppLocalizations.of(context)!.failure_invalid_password);
    } else if (e.code == 'email-already-in-use') {
      return ServerFailure(
          AppLocalizations.of(context)!.failure_email_already_in_use);
    } else if (e.code == 'invalid-credential') {
      return ServerFailure(
          AppLocalizations.of(context)!.failure_email_not_found);
      // return const ServerFailure('Email Not Found');
    } else if (e.code == 'permission-denied') {
      return ServerFailure(
          AppLocalizations.of(context)!.failure_permission_denied);
      // return const ServerFailure(
      //     'Permission denied. You do not have access to this resource.');
    } else if (e.code == 'unavailable') {
      return ServerFailure(AppLocalizations.of(context)!.failure_unknown);
      // 'Firestore service is currently unavailable.'
    } else if (e.code == 'not-found') {
      return ServerFailure(AppLocalizations.of(context)!.failure_unknown);
      // 'Document not found.'
    } else if (e.code == 'object-not-found') {
      return ServerFailure(AppLocalizations.of(context)!.failure_unknown);
      // 'No file found at the specified reference.;
    } else if (e.code == 'unauthenticated') {
      return ServerFailure(
          AppLocalizations.of(context)!.failure_unauthenticated);
      //     'User is not authenticated. Please sign in and try again.'
    } else if (e.code == 'unauthorized') {
      return ServerFailure(AppLocalizations.of(context)!.failure_unauthorized);
      //     'User does not have permission to access this file.'
    } else if (e.code == 'quota-exceeded') {
      return ServerFailure(AppLocalizations.of(context)!.failure_unknown);
      // 'Quota exceeded. Please upgrade your Firebase plan.'
    } else {
      return ServerFailure(AppLocalizations.of(context)!.failure_unknown);
    }
  }

  factory ServerFailure.fromSocketException(SocketException e) {
    return ServerFailure(AppLocalizations.of(context)!.no_internet_connection);
  }

  // for http package
  factory ServerFailure.fromHttpClientException(ClientException e) {
    return ServerFailure("client error : $e");
  }
}

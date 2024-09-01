import 'dart:developer';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> getToken() async {
    try {
      String? token = await messaging.getToken();
      log('$token');
    } on FirebaseException catch (e) {
      String errMessage = FireBaseFailure.fromFireBaseException(e).errMessage;
      log("firebase message error : $errMessage");
    } on PlatformException catch (e) {
      log('PlatformException: ${e.code} - ${e.message}');
      // Handle platform-specific errors
    } catch (e) {
      log("other firebase message error : $e");
    }
  }

  // this method is useless with andriod
  Future<void> requestPermission() async {
    try {
      // these parmeters are used only with ios and web , and doesn't affect on android
      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      log('User granted permission: ${settings.authorizationStatus}');
    } on FirebaseException catch (e) {
      String errMessage = FireBaseFailure.fromFireBaseException(e).errMessage;
      log("firebase message error : $errMessage");
    } on PlatformException catch (e) {
      log('PlatformException: ${e.code} - ${e.message}');
      // Handle platform-specific errors
    } catch (e) {
      log("other firebase message error : $e");
    }
  }

    Future<void> getAccessToken() async {
    try {
      String accessToken = '';
      final serviceAccountJson = await rootBundle.loadString(
          'assets/json/e-commerce-app-10f7e-firebase-adminsdk-qe1nn-2f413b61c7.json');

      final accountCredentials = ServiceAccountCredentials.fromJson(
        json.decode(serviceAccountJson),
      );

      const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

      final client = http.Client();
      try {
        final accessCredentials =
            await obtainAccessCredentialsViaServiceAccount(
          accountCredentials,
          scopes,
          client,
        );

        // setState(() {
          accessToken = accessCredentials.accessToken.data;
        // });

        log('Access Token: $accessToken');
      } catch (e) {
        log('Error obtaining access token: $e');
      } finally {
        client.close();
      }
    } catch (e) {
      log('Error loading service account JSON: $e');
    }
  }


}

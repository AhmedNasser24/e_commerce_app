import 'dart:developer';
import 'dart:io';
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
      String errMessage = ServerFailure.fromFireBaseException(e).errMessage;
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
      String errMessage = ServerFailure.fromFireBaseException(e).errMessage;
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

  Future<void> sendMessage() async {
    var headersList = {
      // 'Accept': '*/*',
      // 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ya29.c.c0ASRK0GbaNoPHY1QdYe8Ujq0R_viBTGiLG-N5PZHGyVdJ0_Pk7CovoS5WGoQJlrmCs48C4HSuFqs7iYG8hcWhHGbn1WjMEaboxuqhb6HHxbJX1lRXNieGuvq0mMGEUrb4c0iBfuZZDu_dx00PLutz2-BU32A70DoJoV1e8V4JHfocEtZIIl4sZ60JtmeNiAz9GtG6xeR5NE4wCKnYIiSf68KFzJegAt0AGPFPVuP7d2v2kQNP0447oqZiZ6D_YZSXkj0OhapjMwwr1HG_qn95MzegX8tJ_wS3H8aB-3PD1SBjXygK_op8-loGCYg8wapoPxuPWz9XqMCPNoei2c6aEr2rUH9LKdEiXC7K7qe1obBWG7NLgWHYMYDArAG387DnYUBuejfWiqguQSO_qilV5M0rF4MXpq0X0JlftOjqxIqlua_7qIJc0Ul2qvzUsv740a4gmMVYcud79ZJwl6FVv05bIiYu7iauX1rcIdQq91jJRVRqev3mwQgQhRgQlXM5pnrSiFWV3kOsWoacZZ5zd06cFQwrBkxZuk2Sq4WhjmwlVd4zsS7bQjSeeaIY_5iBvpMefZ24cQ8rZzbJa0F5bM4zpmV9FnxQIdX-e3uBgnuO8wMh4ntys_zcY1QMaBWRtV8x08I5zZvub4nmv6jy0oej44-a-dYf1457rvOsXwqUslY0p--Bp8j9xvwO5faIJmSjF6cwlwj--akmg03FybcUZFZr8WBZeq68Qr020m9qbOpc3OQt4fit_9h2Mn-fc3Z2xeWFJ8zifQy_Mq9_0BZsZBvmshXxbWMf2v-jjowyZWfs8zs60q-dOR3zq599n8SBui38YiJQ3WyW3ptIcuV3ZkQ_ljOvwqRu45Bbh_7-w9tjxizRO0Ivql770mB3UM7mli3lpx5IllacxJo5hw7rd3R3hBXYfX_I3pw_e-73RvRjyfXVFxyeXU0wJUxfVjMiu54b6b98OnhrchnIbtJQackiVWgJubz9gjc2s_nsXsheR-SJ_Qe'
    };
    var url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/e-commerce-app-10f7e/messages:send');

    var body = {
      "message": {
        "token":
            "cqZVkLmvQaKR_rp6KcSEj2:APA91bEv_L_XJ3CdZaNfFpN9YscuoeXj1rSLLaWKYMZuwHdrYo1SoVhREJVQweVOANTtG4furPp0bQGTbVKvHcol3YwDsFARDmXXRhWuTsNFqbKFlVQdAUoKYbdNjGAyVavfhdkl5FMP",
        "notification": {
          "body": "This is an FCM notification message!",
          "title": "FCM Message"
        },
        "data": {"story_id": "story_12345"}
      }
    };

    try {
      var req = http.Request('POST', url);
      req.headers.addAll(headersList);
      req.body = json.encode(body);

      var res = await req.send();
      final resBody = await res.stream.bytesToString();

      if (res.statusCode >= 200 && res.statusCode < 300) {
        log("resBody: $resBody");
      } else {
        log("res.reasonPhrase: ${res.reasonPhrase}");
      }
    } on SocketException catch (e) {
      String errMessage = ServerFailure.fromSocketException(e).errMessage;
      log("socket error : $errMessage");
    } on http.ClientException catch (e) {
      log("client error : ${e.message}");
    } catch (e) {
      String errMessage = Failure(e.toString()).errMessage;
      log("error : $errMessage");
    }
  }
}

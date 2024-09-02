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

  Future<void> sendMessage({required String accessToken , required String title , required String body}) async {
    var headersList = {
      // 'Accept': '*/*',
      // 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ya29.c.c0ASRK0GZA6GEiZe-_iOgAKDa7_hA6_PHJawJZM2gWShm2Q7lZofLuGCojuEA3xwk5vNM_6p0hi1N3M35HVa8QUkfZgX_-JTKEC6PURqyLFpr9XJg4zT7IsS4n7fHtizlwP1RumHU5rbuDA3Di44GBLCdMdNUjolLF0QxY7NewOvlgCjy1ZP2ZoStXn7jmo4NZnFQJePfRPWw8pOzLJwWAx7k70qgg_CXgK85DeKPXWPoMDQA6LQi774H_RY3Rgvf6Im6oG6jBiNCBIfrSn4C8sw2--28m80ZNUHNLRoMCdmAWoDRB2q8M83V3zo_6mThvYJexXhcvX6b99j9oo_oI4w0bm1h6-fuGP7ry0io44MSN1to1t_LOGvArN385PO3ocj3qRltJehxy_rFvhkZweImhR0YWFha-kYxhX9gsIS6Qv4_ifi1d0F6muZQr7veZYIh3_2B8i7ee6rBy5bbRcjQXxZqs-h2bS1tlzzae7dl6lJUWX4lu2QsvaeWoWMUhv9IjWhO4VrmSInezvirV0Br4clFhqR7zWjYryyVzdiV-qprnJjiRyXBbsMgYFRO3jdjqnBZQ6r-MjF3M4m9gn5-webx29ZeUtg0F2qa1k1-wMht9F2JdrtBsJfR36luckMg8FW_uoyX9Irq0BImzt8rXoRQQji_J2Qig7epsRn81ixqpge5e5IiJV3bh3yq0j19iv7Xdc7RfUae6pfpFS9ruxQhlj_pZhe4l6RfQ4nidrU_kjBSngp6XvQbIfBV06pyF7wXXVrM84hmquOp72djMvj2ssJdag7IFxd-46qibzaMssxbX6mJ3YjFow0WY5eXkQsXxv_mZhcfaxwUI4vu-UjfdywJxqc7XnzoqnUfOuFSo608tnqdqsxdmczceUYpczS2sc6bria_uizdUfi7SFrfwUcoIRYyMFSZyIie3fS1snQpOrd2rBeIbj9Bb0Ov_VVhQdSspmi4ezR84IRBYzpOWrYRXJrk-3eb96mvUwX_0wjSfSpF'
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
      String errMessage = ServerFailure.fromHttpClientException(e).errMessage;
      log("socket error : $errMessage");
    } catch (e) {
      String errMessage = Failure(e.toString()).errMessage;
      log("error : $errMessage");
    }
  }

  void foregroundNotification() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        log('Got a message whilst in the foreground!');
        log('Message data: ${message.data}');

        if (message.notification != null) {
          log('Message also contained a notification: ${message.notification!.title}');
        }
      },
    ).onError((handleError) => log("onError: $handleError"));
  }
}

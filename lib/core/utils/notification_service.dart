import 'dart:developer';
import 'dart:io';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/features/notifications/presentation/views/notification_view.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

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

  Future<void> sendMessageUsingToken(
      {required String accessToken,
      required String title,
      required String body}) async {
    var headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ya29.c.c0ASRK0GZOXukL6MdgBCjW3qzn5fZrEILmda_O4J6RYU91TJNpgThDNvrBWR7odXn2e1zxCrBJBWQaPc7EXl_mH9NK6JE5iPY8vLNLWuRRb-SRNviEiaynvhqyWQAROH_yeE9fEhAp6QgIS2pkpc5pSNb5o5hK-SfBiYIncAfcOpZUinvUb0EZZiacaVolZ0TfMVFURzaRyHROTT5m28GqM6htL1e3zBTNUZiB74b65ZgaxwaWOc4Mg2uR1PcvCfrflckXc8vaWSGAKsMDHebiCgfqACJtUCsqhe5a6S_BqEY8vnrgEaVE7EFKnfVJlpZu49mjdPuAzsY_RkZkJPYvGYnyEWTDtp8tj-iyORm0zs0RDe16LePpPV7hN385AUdMyktiFfuwikqpVlrV4jweJ87tgeBzbl8Mk4WJO1SYWnym8xS0W8l84JnU482s9Wt_OJU2ivVmFQkgjSM7Iddsct_JUQqQj2mmBofec_rZznY8sFl_vwFsuh34yrho13wZkXknztdo7Iz397J6r-cUqk-Ix4X6q3jn4IVyn_uB5-hess4OzJ6an-Ibw1Qbrurf3t4y0IrVqBhdMOShOU7Rxs2aVRq09SsfQ9aW4OXlZwq4uh40UoX4hbW0u1FUu3t6Rd3McFqOfmeuXWpO3sarccV7UQZ80fhVywBpI67vX3BqxfmWfk0y4i7Bv9ldYpmmn0Y8cyYue6dodRv6FyVf_xM9oR6Rm26sxZ_wy3O4MqZ9B_pzI5l2ynuVl8t1iO_lZu9lwo6ezIXuz4Xtr0UYirs4otoRdlinVhoIXzqs0Zc2giBz-VjajRWSYRvv_OX8uIXyl6lndSQen0dqUUoJeZy1zbR7_9MJpO2s3k-XcljtatOdqSMMMpyW0nZjbxOFk5e1slkd3Yo9-FWZ2050hwtwJoJ-Z1-28oy67nldkgm9yj1gM6x1YZjSFqwtFm-Mw6zWd0yFw6b7jWrmUmBiuIhj1S205bnX_xBm8VSR3Bg89zdoxU_W8Y2'
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
        "data": {
          "story_id": "story_12345",
        }
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

  
  


  void foregroundNotificationHandling() {
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
// ------------------------------------------------------------------------------------------
// background notification handling should be in main 
// here is code 

  //   Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    
  //   log("succeed") ;
  
  // }
  // void main() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );   
  //   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  //   Bloc.observer = SimpleBlocObserver();
  //   runApp(const MyApp());
  // }

// ------------------------------------------------------------------------------------------

  Future<void> setupInteractedMessage(context) async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // _handleMessage(initialMessage );
      log("initialMessage: test click");
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => const NotificationView()));
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log ("onMessageOpenedApp: test click");
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const NotificationView()));
    });
  }


  // used to send message to many devices 
  Future<void> sendMessageUsingTopic(
      {required String accessToken,
      required String title,
      required String body}) async {
    var headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization':
          'Bearer ya29.c.c0ASRK0GZOXukL6MdgBCjW3qzn5fZrEILmda_O4J6RYU91TJNpgThDNvrBWR7odXn2e1zxCrBJBWQaPc7EXl_mH9NK6JE5iPY8vLNLWuRRb-SRNviEiaynvhqyWQAROH_yeE9fEhAp6QgIS2pkpc5pSNb5o5hK-SfBiYIncAfcOpZUinvUb0EZZiacaVolZ0TfMVFURzaRyHROTT5m28GqM6htL1e3zBTNUZiB74b65ZgaxwaWOc4Mg2uR1PcvCfrflckXc8vaWSGAKsMDHebiCgfqACJtUCsqhe5a6S_BqEY8vnrgEaVE7EFKnfVJlpZu49mjdPuAzsY_RkZkJPYvGYnyEWTDtp8tj-iyORm0zs0RDe16LePpPV7hN385AUdMyktiFfuwikqpVlrV4jweJ87tgeBzbl8Mk4WJO1SYWnym8xS0W8l84JnU482s9Wt_OJU2ivVmFQkgjSM7Iddsct_JUQqQj2mmBofec_rZznY8sFl_vwFsuh34yrho13wZkXknztdo7Iz397J6r-cUqk-Ix4X6q3jn4IVyn_uB5-hess4OzJ6an-Ibw1Qbrurf3t4y0IrVqBhdMOShOU7Rxs2aVRq09SsfQ9aW4OXlZwq4uh40UoX4hbW0u1FUu3t6Rd3McFqOfmeuXWpO3sarccV7UQZ80fhVywBpI67vX3BqxfmWfk0y4i7Bv9ldYpmmn0Y8cyYue6dodRv6FyVf_xM9oR6Rm26sxZ_wy3O4MqZ9B_pzI5l2ynuVl8t1iO_lZu9lwo6ezIXuz4Xtr0UYirs4otoRdlinVhoIXzqs0Zc2giBz-VjajRWSYRvv_OX8uIXyl6lndSQen0dqUUoJeZy1zbR7_9MJpO2s3k-XcljtatOdqSMMMpyW0nZjbxOFk5e1slkd3Yo9-FWZ2050hwtwJoJ-Z1-28oy67nldkgm9yj1gM6x1YZjSFqwtFm-Mw6zWd0yFw6b7jWrmUmBiuIhj1S205bnX_xBm8VSR3Bg89zdoxU_W8Y2'
    };
    var url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/e-commerce-app-10f7e/messages:send');

    var body = {
      "message": {
        "notification": {
          "body": "This is an FCM notification message!",
          "title": "FCM Message"
        },
        "data": {
          "story_id": "story_12345",
        },
        "topic": "01066505898"
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

  Future<void> subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic("01066505898");
  }

  Future<void> unsubscribeFromTopic() async {
    await FirebaseMessaging.instance.unsubscribeFromTopic("01066505898");
  }
}

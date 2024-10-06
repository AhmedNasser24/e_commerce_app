import 'dart:developer';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../features/notifications/data/model/notification_model.dart';
import '../../features/trader/presentation/views/product_details_view_for_customer.dart';
import '../models/product_item_model.dart';

class NotificationService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<String> getToken() async {
    try {
      String? token = await messaging.getToken();
      log('$token');
      return token!;
    } on FirebaseException catch (e) {
      String errMessage = ServerFailure.fromFireBaseException(e).errMessage;
      log("firebase message error : $errMessage");
      rethrow;
    } on PlatformException catch (e) {
      log('PlatformException: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      log("other firebase message error : $e");
      rethrow;
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

  Future<String> getAccessToken() async {
    String accessToken = '';
    final serviceAccountJson = await rootBundle.loadString(
        'assets/json/e-commerce-app-10f7e-firebase-adminsdk-qe1nn-2f413b61c7.json');

    final accountCredentials = ServiceAccountCredentials.fromJson(
      json.decode(serviceAccountJson),
    );

    const scopes = ['https://www.googleapis.com/auth/firebase.messaging'];

    final client = http.Client();
    try {
      final accessCredentials = await obtainAccessCredentialsViaServiceAccount(
        accountCredentials,
        scopes,
        client,
      );
      accessToken = accessCredentials.accessToken.data;

      log('Access Token: $accessToken');
      return accessToken;
    } finally {
      client.close();
    }
  }

  Future<void> sendMessageUsingToken(
      {required NotificationModel notificationModel}) async {
    var headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${notificationModel.accessToken}',
    };
    var url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/e-commerce-app-10f7e/messages:send');

    var body = {
      "message": {
        // token ony change when you reinstall the app or change the device
        "token": notificationModel.token,
        "notification": {
          "title": notificationModel.title,
          "body": notificationModel.body,
        },
        "data": notificationModel.productItemModel?.toJson() ?? {},
      }
    };

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

  Future<void> setupInteractedMessageForTerminatedState(
      BuildContext context) async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      // _handleMessage(initialMessage );
      log("initialMessage: test click");
      ProductItemModel productItemModel =
          ProductItemModel.fromJson(initialMessage.data);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailsViewForCustomer(productItemModel: productItemModel)));
    }
  }

  void setupInteractedMessageForBackgroundNotification(BuildContext context) {
    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      ProductItemModel productItemModel =
          ProductItemModel.fromJson(message.data);
      log("onMessageOpenedApp: test click");
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProductDetailsViewForCustomer(productItemModel: productItemModel)),
      );
    });
  }

  // used to send message to many devices
  Future<void> sendMessageUsingTopic({
    required NotificationModel notificationModel,
  }) async {
    var headersList = {
      'Accept': '*/*',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${notificationModel.accessToken}',
    };
    var url = Uri.parse(
        'https://fcm.googleapis.com/v1/projects/e-commerce-app-10f7e/messages:send');

    var body = {
      "message": {
        "notification": {
          "title": notificationModel.title,
          "body": notificationModel.body,
        },
        "data": notificationModel.productItemModel?.toJson() ?? {},
        "topic": kNotificationTopic,
      }
    };

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
  }

  Future<void> subscribeToTopic() async {
    await FirebaseMessaging.instance.subscribeToTopic(
      kNotificationTopic,
    );
  }

  Future<void> unsubscribeFromTopic() async {
    await FirebaseMessaging.instance.unsubscribeFromTopic(
      kNotificationTopic,
    );
  }

  // put in main.dart

  // void initState() {
  //   NotificationService().requestPermission();
  //   NotificationService().getToken();
  //   NotificationService().getAccessToken();
  //   NotificationService().foregroundNotificationHandling();
  // --------------------------------------------------------------------------------------
  //             those functions are in login view initstate because of context issue of navigation
  // NotificationService().setupInteractedMessageForBackgroundNotification(context);
  // NotificationService().setupInteractedMessageForTerminatedState(context);
  // --------------------------------------------------------------------------------------
  //   super.initState();
  // }
}

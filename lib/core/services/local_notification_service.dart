import 'dart:async';
import 'dart:convert';

import 'package:e_commerce/constants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    streamController.add(notificationResponse);
    // Navigator.push(context, route);
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  //basic Notification
  static void showBasicNotification(RemoteMessage message) async {
    String? imageUrl = message.notification?.android?.imageUrl;
    BigPictureStyleInformation? bigPictureStyleInformation;
    if (imageUrl != null) {
      final http.Response image = await http
          .get(Uri.parse(message.notification?.android?.imageUrl ?? ''));
      bigPictureStyleInformation = BigPictureStyleInformation(
        ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(image.bodyBytes),
        ),
        largeIcon: ByteArrayAndroidBitmap.fromBase64String(
          base64Encode(image.bodyBytes),
        ),
      );
    }
    AndroidNotificationDetails android = AndroidNotificationDetails(
      kNotificationChannelName, // New channel ID , you should change channel_id if you change notification sound
      'Azkar Channel',
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: bigPictureStyleInformation,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('azkar'),
    );
    NotificationDetails details = NotificationDetails(
      android: android,
      iOS: const DarwinNotificationDetails(sound: 'azkar.mp3'),
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      details,
    );
  }
}
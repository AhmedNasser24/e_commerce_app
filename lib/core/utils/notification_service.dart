import 'dart:developer';
import 'package:e_commerce/core/errors/failure.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

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
}

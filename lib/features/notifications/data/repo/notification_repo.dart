import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../model/notification_model.dart';

abstract class NotificationRepo {
  Future<Either <String , Failure >> getToken();
  Future<Either <String , Failure >> getAccessToken();
  Future<Either <void , Failure >> sendMessageUsingToken({required NotificationModel notificationModel});
  Future<Either <void , Failure >> sendMessageUsingTopic({required NotificationModel notificationModel});
  Future<Either <void , Failure >> subscribeToTopic();
  Future<Either <void , Failure >> unsubscribeFromTopic();
}
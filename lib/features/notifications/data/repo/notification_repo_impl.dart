import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/utils/notification_service.dart';

import 'package:e_commerce/features/notifications/data/model/notification_model.dart';
import 'package:http/http.dart' as http;

import 'notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  @override
  Future<Either<String, Failure>> getAccessToken() async{
    try {
      String token = await NotificationService().getAccessToken();
      return left(token);
    } on FirebaseException catch (e) {
      log("firebase message error : $e");
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromSocketException(e));
    } on http.ClientException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromHttpClientException(e));
    } catch (e) {
      log("error : $e");
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<String, Failure>> getToken() async{
    try {
      String token = await NotificationService().getToken();
      return left(token);
    } on FirebaseException catch (e) {
      log("firebase message error : $e");
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromSocketException(e));
    } on http.ClientException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromHttpClientException(e));
    } catch (e) {
      log("error : $e");
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> sendMessageUsingToken(
      {required NotificationModel notificationModel}) async {
    try {
      String accesstoken = await NotificationService().getAccessToken();
      notificationModel.accessToken = accesstoken;
      NotificationService().sendMessageUsingToken(notificationModel: notificationModel) ;
      return left(null);
    } on FirebaseException catch (e) {
      log("firebase message error : $e");
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromSocketException(e));
    } on http.ClientException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromHttpClientException(e));
    } catch (e) {
      log("error : $e");
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> sendMessageUsingTopic(
      {required NotificationModel notificationModel}) async {
    try {
      String accesstoken = await NotificationService().getAccessToken();
      notificationModel.accessToken = accesstoken;
      NotificationService()
          .sendMessageUsingTopic(notificationModel: notificationModel);
      return left(null);
    } on FirebaseException catch (e) {
      log("firebase message error : $e");
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromSocketException(e));
    } on http.ClientException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromHttpClientException(e));
    } catch (e) {
      log("error : $e");
      return right(Failure(e.toString()));
    }
  }

  @override
  Future<Either<void, Failure>> subscribeToTopic() async{
    try {
      await NotificationService().subscribeToTopic();
      return left(null);
    } on FirebaseException catch (e) {
      log("firebase message error : $e");
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromSocketException(e));
    } on http.ClientException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromHttpClientException(e));
    } catch (e) {
      log("error : $e");
      return right(Failure(e.toString()));
    }
  }
  
 

  @override
  Future<Either<void, Failure>> unsubscribeFromTopic() async {
    try {
      await NotificationService().unsubscribeFromTopic();
      return left(null);
    } on FirebaseException catch (e) {
      log("firebase message error : $e");
      return right(ServerFailure.fromFireBaseException(e));
    } on SocketException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromSocketException(e));
    } on http.ClientException catch (e) {
      log("socket error : $e");
      return right(ServerFailure.fromHttpClientException(e));
    } catch (e) {
      log("error : $e");
      return right(Failure(e.toString()));
    }
  }
}

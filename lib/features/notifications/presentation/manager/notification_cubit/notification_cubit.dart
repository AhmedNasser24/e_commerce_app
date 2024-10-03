import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/notifications/data/repo/notification_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/model/notification_model.dart';
import '../../../data/repo/notification_repo_impl.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());
  final NotificationRepo __notificationRepo = NotificationRepoImpl();

  Future<void> getToken() async {
    emit(NotificationLoading());
    final Either<String, Failure> result = await __notificationRepo.getToken();
    result.fold(
      (token) => emit(NotificationSuccess()),
      (failure) => emit(NotificationFailure(failure.errMessage)),
    );
  }

  Future<void> getAccessToken() async {
    emit(NotificationLoading());
    final Either<String, Failure> result = await __notificationRepo.getToken();
    result.fold(
      (token) => emit(NotificationSuccess()),
      (failure) => emit(NotificationFailure(failure.errMessage)),
    );
  }

  Future<void> subscribeToTopic() async {
    emit(NotificationLoading());
    final Either<void, Failure> result =
        await __notificationRepo.subscribeToTopic();
    result.fold(
      (value) => emit(NotificationSuccess()),
      (failure) => emit(NotificationFailure(failure.errMessage)),
    );
  }

  Future<void> unsubscribeFromTopic() async {
    emit(NotificationLoading());
    final Either<void, Failure> result =
        await __notificationRepo.unsubscribeFromTopic();
    result.fold(
      (value) => emit(NotificationSuccess()),
      (failure) => emit(NotificationFailure(failure.errMessage)),
    );
  }

  Future<void> sendMessageUsingToken(
      {required NotificationModel notificationModel}) async {
    emit(NotificationLoading());
    final Either<void, Failure> result = await __notificationRepo
        .sendMessageUsingToken(notificationModel: notificationModel);

    result.fold(
      (value) => emit(NotificationSuccess()),
      (failure) => emit(NotificationFailure(failure.errMessage)),
    );
  }

  Future<void> sendMessageUsingTopic(
      {required NotificationModel notificationModel}) async {
    emit(NotificationLoading());
    final Either<void, Failure> result = await __notificationRepo
        .sendMessageUsingTopic(notificationModel: notificationModel);
    result.fold(
      (value) => emit(NotificationSuccess()),
      (failure) => emit(NotificationFailure(failure.errMessage)),
    );
  }
}

part of 'notification_cubit.dart';

abstract class NotificationState {}

class NotificationInitial extends NotificationState {}
class NotificationLoading extends NotificationState {}
class NotificationSuccess extends NotificationState {}
class NotificationFailure extends NotificationState {
  final String errMessage ;

  NotificationFailure(this.errMessage);
}

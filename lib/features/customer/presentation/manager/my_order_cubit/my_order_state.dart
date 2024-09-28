part of 'my_order_cubit.dart';

abstract class MyOrderState {}

class MyOrderInitial extends MyOrderState {}
class MyOrderSuccess extends MyOrderState {
  final List < MyOrderItemModel > myOrderItemModelList ;
  MyOrderSuccess({required this.myOrderItemModelList});
}
class MyOrderFailure extends MyOrderState {
  final String errMessage ;
  MyOrderFailure(this.errMessage);
}
class MyOrderLoading extends MyOrderState {}

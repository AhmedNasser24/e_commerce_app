part of 'fetch_new_orders_cubit.dart';

abstract class FetchNewOrdersState {}

class FetchNewOrdersInitial extends FetchNewOrdersState {}
class FetchNewOrdersLoading extends FetchNewOrdersState {}
class FetchNewOrdersSuccess extends FetchNewOrdersState {
  final List<BuyProductModel> buyProductModelList;
  FetchNewOrdersSuccess(this.buyProductModelList);
}
class FetchNewOrdersFailure extends FetchNewOrdersState {
  final String errMessage ;

  FetchNewOrdersFailure(this.errMessage);
}

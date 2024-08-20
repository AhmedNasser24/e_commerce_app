part of 'fetch_trader_product_only_cubit.dart';

abstract class FetchTraderProductOnlyState {}

class FetchTraderProductOnlyInitial extends FetchTraderProductOnlyState {}
class FetchTraderProductOnlyLoading extends FetchTraderProductOnlyState {}
class FetchTraderProductOnlySuccess extends FetchTraderProductOnlyState {
  final List < ProductItemModel > productItemModelList ;
  FetchTraderProductOnlySuccess({required this.productItemModelList});
}
class FetchTraderProductOnlyFailure extends FetchTraderProductOnlyState {
  final String errMessage ;

  FetchTraderProductOnlyFailure(this.errMessage);
}

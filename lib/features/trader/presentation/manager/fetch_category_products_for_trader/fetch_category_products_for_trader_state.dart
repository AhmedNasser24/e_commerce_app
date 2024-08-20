part of 'fetch_category_products_for_trader_cubit.dart';

abstract class FetchCategoryProductsForTraderState {}

class FetchCategoryProductsForTraderInitial extends FetchCategoryProductsForTraderState {}
class FetchCategoryProductsForTraderLoading extends FetchCategoryProductsForTraderState {}
class FetchCategoryProductsForTraderSuccess extends FetchCategoryProductsForTraderState {
  final List < ProductItemModel > productItemModelList ;
  FetchCategoryProductsForTraderSuccess({required this.productItemModelList});
}
class FetchCategoryProductsForTraderFailure extends FetchCategoryProductsForTraderState {
  final String errMessage ;
  FetchCategoryProductsForTraderFailure(this.errMessage);
}

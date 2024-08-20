part of 'fetch_category_product_for_customer_cubit.dart';

abstract class FetchCategoryProductForCustomerState {}

class FetchCategoryProductForCustomerInitial
    extends FetchCategoryProductForCustomerState {}

class FetchCategoryProductForCustomerLoading
    extends FetchCategoryProductForCustomerState {}

class FetchCategoryProductForCustomerSuccess
    extends FetchCategoryProductForCustomerState {
  final List<ProductItemModel> productItemModelList;
  FetchCategoryProductForCustomerSuccess({required this.productItemModelList});
}

class FetchCategoryProductForCustomerFailure
    extends FetchCategoryProductForCustomerState {
  final String errMessage;
  FetchCategoryProductForCustomerFailure(this.errMessage);
}

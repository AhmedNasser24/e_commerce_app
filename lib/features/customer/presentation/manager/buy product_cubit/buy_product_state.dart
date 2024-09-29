part of 'buy_product_cubit.dart';

abstract class BuyProductState {}

class BuyProductInitial extends BuyProductState {}
class BuyProductLoading extends BuyProductState {}
class BuyProductSuccess extends BuyProductState {
  final List <CartItemModel> cartItemModelList;
  BuyProductSuccess(this.cartItemModelList);
}
class BuyProductFailure extends BuyProductState {
  final String errMessage;
  BuyProductFailure(this.errMessage);
}

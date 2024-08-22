part of 'buy_product_cubit.dart';

abstract class BuyProductState {}

class BuyProductInitial extends BuyProductState {}
class BuyProductLoading extends BuyProductState {}
class BuyProductSuccess extends BuyProductState {}
class BuyProductFailure extends BuyProductState {
  final String errMessage;
  BuyProductFailure(this.errMessage);
}

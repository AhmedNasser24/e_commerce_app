part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartSuccess extends CartState {
  final List < CartItemModel > cartItemModelList ;
  CartSuccess({required this.cartItemModelList});
}
class CartFailure extends CartState {
  final String errMessage;
  CartFailure(this.errMessage);
}

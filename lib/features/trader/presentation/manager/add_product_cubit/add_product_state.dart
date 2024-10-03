part of 'add_product_cubit.dart';

abstract class AddProductState {}

class AddProductInitial extends AddProductState {}
class AddProductLoading extends AddProductState {}
class AddProductSuccess extends AddProductState {
  final ProductItemModel productItemModel;
  AddProductSuccess(this.productItemModel);
}
class AddProductFailure extends AddProductState {
  final String errMessage ;
  AddProductFailure(this.errMessage) ;
}

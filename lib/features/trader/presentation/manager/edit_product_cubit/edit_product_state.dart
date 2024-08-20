part of 'edit_product_cubit.dart';

abstract class EditProductState {}

class EditProductInitial extends EditProductState {}
class EditProductLoading extends EditProductState {}
class EditProductSuccess extends EditProductState {}
class EditProductFailure extends EditProductState {
  final String errMessage ;

  EditProductFailure(this.errMessage);
}

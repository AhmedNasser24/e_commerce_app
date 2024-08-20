
import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/models/add_to_cart_model.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../data/repo/customer_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final CustomerRepo __customerRepoImpl = CustomerRepoImpl();
  Future < void > addToCart({required ProductItemModel productItemModel})async{
    emit(CartLoading());
    AddToCartModel addToCartModel = AddToCartModel(productItemModel: productItemModel, addToCartDate: DateTime.now().toString());
    Either < void , Failure > result = await __customerRepoImpl.addToCart(addToCartModel: addToCartModel) ;
  
    result.fold(
      (ok) => emit(CartSuccess()),
      (failure) => emit(CartFailure(failure.errMessage)),
    );
  }

}

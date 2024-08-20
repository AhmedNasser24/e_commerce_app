import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/cart_item_model.dart';
import '../../../data/repo/customer_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final CustomerRepo __customerRepoImpl = CustomerRepoImpl();
  List<CartItemModel> cartItemList = [];
  Future<void> addToCart(
      {required ProductItemModel productItemModel, required context}) async {
    CartItemModel addToCartModel = CartItemModel(
        productItemModel: productItemModel,
        addToCartDate: DateTime.now().toString());
    Either<void, Failure> result =
        await __customerRepoImpl.addToCart(addToCartModel: addToCartModel);
    result.fold(
      (ok) {
        showSnackBar(context, S.of(context).product_is_added_to_cart);
      },
      (failure) {
        showSnackBar(context, S.of(context).error_product_is_not_added_to_cart);
      },
    );
  }

  Future<void> fetchCartItem() async {
    emit(CartLoading());
    Either<List<CartItemModel>, Failure> result =
        await __customerRepoImpl.fetchCartItems();
    result.fold(
      (cartItemModelList) {
        emit(CartSuccess(cartItemModelList: cartItemModelList));
      },
      (fail) {
        emit(CartFailure(fail.toString()));
      },
    );
  }
}

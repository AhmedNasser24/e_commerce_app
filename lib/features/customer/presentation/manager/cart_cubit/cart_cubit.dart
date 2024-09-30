import 'dart:math';

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
  bool __isFetchingBefore = false;
  Future<void> addToCart({
    required ProductItemModel productItemModel,
    required context,
  }) async {
    CartItemModel cartItemModel = CartItemModel(
      productItemModel: productItemModel,
      addToCartDate: DateTime.now().toString(),
      orderId: Random().nextDouble().toString(),
    );
    Either<void, Failure> result =
        await __customerRepoImpl.addToCart(cartItemModel: cartItemModel);
    result.fold(
      (ok) {
        showSnackBar(context, S.of(context).product_is_added_to_cart);
      },
      (failure) {
        showSnackBar(context, S.of(context).error_product_is_not_added_to_cart);
      },
    );
  }

  Future<void> removeProductFromCart({
    required CartItemModel cartItemModel,
    required context,
  }) async {
    Either<void, Failure> result = await __customerRepoImpl
        .removeProductFromCart(cartItemModel: cartItemModel);
    result.fold(
      (ok) {
        showSnackBar(context, S.of(context).product_is_removed_from_cart);
      },
      (failure) {
        showSnackBar(
            context, S.of(context).error_product_is_not_removed_from_cart);
      },
    );

    // fetch without loading after removing product from cart
    Either<List<CartItemModel>, Failure> result1 =
        await __customerRepoImpl.fetchCartItems();
    result1.fold(
      (cartItemModelList) {
        emit(CartSuccess(cartItemModelList: cartItemModelList));
      },
      (fail) {},
    );
  }

  Future<void> removeAllProductFromCart({
    required List<CartItemModel> cartItemModelList,
    required context,
  }) async {
    await __customerRepoImpl.removeAllProductFromCart(
        cartItemModelList: cartItemModelList);
  }

  Future<void> fetchCartItem() async {
    
    __isFetchingBefore == true ? null : emit(CartLoading());
    __isFetchingBefore = true;
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

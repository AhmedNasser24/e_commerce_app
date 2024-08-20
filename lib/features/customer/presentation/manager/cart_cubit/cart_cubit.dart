import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/features/customer/data/models/add_to_cart_model.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/repo/customer_repo_impl.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  final CustomerRepo __customerRepoImpl = CustomerRepoImpl();
  Future<void> addToCart(
      {required ProductItemModel productItemModel, required context}) async {
    AddToCartModel addToCartModel = AddToCartModel(
        productItemModel: productItemModel,
        addToCartDate: DateTime.now().toString());
    Either<void, Failure> result =
        await __customerRepoImpl.addToCart(addToCartModel: addToCartModel);
    log("cubit");
    result.fold(
      (ok) {
        log("ok");
        showSnackBar(context, S.of(context).product_is_added_to_cart);
      },
      (failure) {
        showSnackBar(context, S.of(context).error_product_is_not_added_to_cart);
      },
    );
  }
}

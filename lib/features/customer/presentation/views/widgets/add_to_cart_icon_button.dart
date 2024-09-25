
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class AddToCartIconButton extends StatelessWidget {
  const AddToCartIconButton({
    super.key,
    required this.productItemModel,
  });

  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<CartCubit>(context).addToCart(
            productItemModel: productItemModel, context: context);
      },
      icon: const Icon(
        Icons.shopping_cart_checkout,
        color: kPurpleColor,
      ),
    );
  }
}

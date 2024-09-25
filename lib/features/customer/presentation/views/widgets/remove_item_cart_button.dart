import 'package:e_commerce/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/cart_item_model.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class RemoveItemCartButton extends StatelessWidget {
  const RemoveItemCartButton({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    // return CustomButton(
    //   title: S.of(context).remove_from_card,
    //   style: AppStyle.medium12.copyWith(color: kWhiteColor),
    //   backGroundColor: kPurpleColor,
    //   onTap: () {
    //     BlocProvider.of<CartCubit>(context)
    //         .removeProductFromCart(cartItemModel: cartItemModel , context: context);
    //   },
    // );
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CartCubit>(context).removeProductFromCart(
            cartItemModel: cartItemModel, context: context);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPurpleColor,
        ),
        child: Text(
          S.of(context).remove_from_card,
          style: AppStyle.regular12.copyWith(color: kWhiteColor),
        ),
      ),
    );
  }
}

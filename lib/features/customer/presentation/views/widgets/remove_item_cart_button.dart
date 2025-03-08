import 'package:e_commerce/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../constants.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/cart_item_model.dart';
import '../../manager/cart_cubit/cart_cubit.dart';

class RemoveItemCartButton extends StatelessWidget {
  const RemoveItemCartButton({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CartCubit>(context).removeProductFromCart(
            cartItemModel: cartItemModel, context: context);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        constraints: const BoxConstraints(minWidth: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: kPurpleColor,
        ),
        child: Text(
          LocaleKeys.remove_from_card.tr(),
          style: AppStyle.regular12.copyWith(color: kWhiteColor),
        ),
      ),
    );
  }
}

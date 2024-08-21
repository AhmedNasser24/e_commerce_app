import 'package:e_commerce/core/utils/app_style.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/cart_item_model.dart';

class RemoveItemCartButton extends StatelessWidget {
  const RemoveItemCartButton({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).remove_from_card,
      style: AppStyle.medium12,
      backGroundColor: const Color.fromARGB(255, 98, 170, 229),
      onTap: () {
        BlocProvider.of<CartCubit>(context)
            .removeProductFromCart(cartItemModel: cartItemModel , context: context);
      },
    );
  }
}

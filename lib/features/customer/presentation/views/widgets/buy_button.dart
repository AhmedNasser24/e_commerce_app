import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/cart_item_model.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key, required this.cartItemModelList});
  final List<CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<BuyProductCubit, BuyProductState>(
      listener: (context, state) {
        if (state is BuyProductLoading) {
          isLoading = true;
        } else if (state is BuyProductSuccess) {
          isLoading = false;
          showAwesomeDialog(context);
        } else if (state is BuyProductFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: isLoading,
          title: S.of(context).buy,
          style: AppStyle.semiBold20,
          onTap: () {
            BlocProvider.of<BuyProductCubit>(context)
                .buyProduct(cartItemModelList: cartItemModelList);
          },
        );
      },
    );
  }

  void showAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: S.of(context).thank_you,
      desc: S.of(context).we_will_contact_you_within_24_hours,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
      dismissOnTouchOutside: false ,
    ).show();
  }
}

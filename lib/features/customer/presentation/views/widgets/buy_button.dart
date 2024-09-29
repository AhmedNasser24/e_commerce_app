import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../../moyasar_payment/presentation/views/moyasar_payment_view.dart';
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
          showThankYouAwesomeDialog(context);
          BlocProvider.of<CartCubit>(context).removeAllProductFromCart(cartItemModelList: cartItemModelList, context: context);
          // add those products to customer products ( my orders )
          
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MoyasarPaymentView(
          //         amount: getTotalPriceX100(cartItemModelList)),
          //   ),
          // );
        } else if (state is BuyProductFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: isLoading,
          title: S.of(context).buy,
          style: AppStyle.semiBold20.copyWith(color:kWhiteColor),
          horizontalMargin: 50,
          verticalMargin: 0,
          onTap: () {
            showSubmitAwesomeDialog(context);
            
          },
        );
      },
    );
  }

  void showThankYouAwesomeDialog(context) {
    AwesomeDialog(
      
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: S.of(context).thank_you,
      desc: S.of(context).we_will_contact_you_within_24_hours,
      btnOkText: S.of(context).ok,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
      dismissOnTouchOutside: false,
    ).show();
  }

  void showSubmitAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dismissOnTouchOutside: false,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: S.of(context).confirm_order,
      desc: S.of(context).do_you_want_to_confirm_your_order_purchase,
      btnOkText: S.of(context).ok,
      btnCancelText: S.of(context).cancel,
      btnOkOnPress: () {
        BlocProvider.of<BuyProductCubit>(context)
                .buyProduct(cartItemModelList: cartItemModelList);
      },
      btnCancelOnPress: () {},
    ).show();
  }

  int getTotalPriceX100(List<CartItemModel> cartItemModelList) {
    double total = 0;
    for (int i = 0; i < cartItemModelList.length; i++) {
      total += double.parse(cartItemModelList[i].productItemModel.price!);
    }
    total *= 100;
    return total.toInt();
  }
}

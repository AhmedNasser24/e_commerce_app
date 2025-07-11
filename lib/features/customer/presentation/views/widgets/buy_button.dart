import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:e_commerce/features/moyasar_payment/presentation/views/moyasar_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../data/models/cart_item_model.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key, required this.cartItemModelList});
  final List<CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: BlocProvider.of<BuyProductCubit>(context).isLoading,
      title: AppLocalizations.of(context)!.buy,
      style: AppStyle.semiBold20.copyWith(color: kWhiteColor),
      horizontalMargin: 50,
      verticalMargin: 0,
      onTap: () {
        showSubmitAwesomeDialog(context);
      },
    );
  }

  void showSubmitAwesomeDialog(context) {
    AwesomeDialog(
      width: kMaxWidthForDialog,
      context: context,
      // dismissOnTouchOutside: false,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: AppLocalizations.of(context)!.confirm_order,
      desc: AppLocalizations.of(context)!
          .do_you_want_to_confirm_your_order_purchase,
      btnOkText: AppLocalizations.of(context)!.credit,
      btnCancelText: AppLocalizations.of(context)!.cash,
      btnOkOnPress: () {
        Navigator.pushNamed(context, MoyasarPaymentView.routeName,
            arguments: cartItemModelList);
      },
      btnCancelOnPress: () {
        BlocProvider.of<BuyProductCubit>(context)
            .buyProduct(cartItemModelList: cartItemModelList, isPaid: false, context: context);
      },
    ).show();
  }
}

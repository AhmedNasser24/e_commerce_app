import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/add_to_cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../constants.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_style.dart';
import '../../../trader/presentation/views/widgets/back_arrow_button.dart';
import '../../data/models/cart_item_model.dart';
import '../manager/buy product_cubit/buy_product_cubit.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({super.key});

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
          

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MoyasarPaymentView(
          //         amount: getTotalPriceX100(state.cartItemModelList)),
          //   ),
          // );
        } else if (state is BuyProductFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body:  AddToCartViewBody(isLoading: isLoading),
          appBar: addToCartAppBar(context , isLoading),
        );
      },
    );
  }

  AppBar addToCartAppBar(BuildContext context , bool isLoading) {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.my_cart, style: AppStyle.medium22.copyWith(color : kWhiteColor)),
      centerTitle: true,
      leading:  BackArrowButton(
        color: kWhiteColor,
        dismissAction: isLoading ? true : false,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kPurpleColor,
    );
  }

  void showThankYouAwesomeDialog(context) {
    AwesomeDialog(
      width: kMaxWidthForDialog,
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      title: AppLocalizations.of(context)!.thank_you,
      desc: AppLocalizations.of(context)!.we_will_contact_you_within_24_hours,
      btnOkText: AppLocalizations.of(context)!.ok,
      btnOkOnPress: () {
        Navigator.pop(context);
      },
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
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

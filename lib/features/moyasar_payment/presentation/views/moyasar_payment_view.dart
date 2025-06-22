import 'dart:developer';

import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/utils/moyasser_keys.dart';
import 'package:e_commerce/features/customer/data/models/cart_item_model.dart';
import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moyasar/moyasar.dart';

class MoyasarPaymentView extends StatelessWidget {
  const MoyasarPaymentView({super.key,  required this.cartItemModelList});

  final List<CartItemModel> cartItemModelList;
  static const String routeName = '/moyasar_payment_view';
  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      BuildContext context = navigatorKey.currentContext!;
      switch (result.status) {
        case PaymentStatus.paid:
          log("payment success");
          BlocProvider.of<BuyProductCubit>(context)
            .buyProduct(cartItemModelList: cartItemModelList, context: context);
          showSnackBar(context, AppLocalizations.of(context)!.payment_successful);
          Navigator.pop(context);
          break;
        case PaymentStatus.failed:
          log("payment failed");
          showSnackBar(context, AppLocalizations.of(context)!.payment_failed);
          break;
        case PaymentStatus.initiated:
          log('payment initiated');
        case PaymentStatus.authorized:
          log('payment authorized');
        case PaymentStatus.captured:
          log('payment captured');
      }
    }
  }
  int getTotalPriceX100(List<CartItemModel> cartItemModelList) {
    double total = 0;
    for (int i = 0; i < cartItemModelList.length; i++) {
      total += double.parse(cartItemModelList[i].productItemModel.price!);
    }
    total *= 100;
    return total.toInt();
  }
  @override
  Widget build(BuildContext context) {
    int amount = getTotalPriceX100(cartItemModelList);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ApplePay(
            //     config: paymentConfig,
            //     onPaymentResult: onPaymentResult,
            // ),
            // const Text("or"),
            const Spacer(),
            CreditCard(
              config: PaymentConfig(
                publishableApiKey: MoyassarKeys.publishableKey,
                amount: amount, // SAR 257.58

                description: 'order #1324',
                metadata: {'size': '250g'},
                // applePay: ApplePayConfig(merchantId: 'YOUR_MERCHANT_ID', label: 'YOUR_STORE_NAME'),
              ),
              onPaymentResult: onPaymentResult,

            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}

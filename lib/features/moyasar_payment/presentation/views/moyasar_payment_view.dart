import 'dart:developer';

import 'package:e_commerce/core/utils/moyasser_keys.dart';
import 'package:flutter/material.dart';
import 'package:moyasar/moyasar.dart';

class MoyasarPaymentView extends StatelessWidget {
  const MoyasarPaymentView({super.key, required this.amount});

  final int amount ;

  void onPaymentResult(result) {
    if (result is PaymentResponse) {
      switch (result.status) {
        case PaymentStatus.paid:
          log("payment success");
          break;
        case PaymentStatus.failed:
          log("payment failed");
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

  @override
  Widget build(BuildContext context) {
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

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/data/models/my_order_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key, required this.myOrderItemModel});
  final MyOrderItemModel myOrderItemModel ;
  @override
  Widget build(BuildContext context) {
    String productName = myOrderItemModel.cartItemModel.productItemModel.name!;
    String productPrice = myOrderItemModel.cartItemModel.productItemModel.price!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Radio(
          activeColor: kPurpleColor,
          value: '0', groupValue: 0, onChanged: (value){}),
        title: Text(productName, style: AppStyle.medium16),
        subtitle: Text("$productPrice ${S.of(context).LE}", style: AppStyle.semiBold16)
      ),
    );
  }
}
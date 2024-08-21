import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/cart_item_model.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({
    super.key,
    required this.cartItemModelList,
  });
  final List<CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.of(context).total_price,
          style: AppStyle.bold22,
        ),
        const Gap(6),
        Text(
          "${addTotalPrice(cartItemModelList)} ${S.of(context).LE}",
          style: AppStyle.medium18,
        ),
      ],
    );
  }

  addTotalPrice(List<CartItemModel> cartItemModelList) {
    double total = 0;
    for (int i = 0; i < cartItemModelList.length; i++) {
      total += double.parse(cartItemModelList[i].productItemModel.price!);
    }
    return total;
  }
}

import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0 ),
      child: Row(
        children: [
          Text(
            "${S.of(context).total_price}:",
            style: AppStyle.medium18,
          ),
          const Spacer(),
          Text(
            "${getTotalPrice(cartItemModelList)} ${S.of(context).LE}",
            style: AppStyle.semiBold18,
          ),
        ],
      ),
    );
  }

  getTotalPrice(List<CartItemModel> cartItemModelList) {
    double total = 0;
    for (int i = 0; i < cartItemModelList.length; i++) {
      total += double.parse(cartItemModelList[i].productItemModel.price!);
    }
    return total;
  }
}

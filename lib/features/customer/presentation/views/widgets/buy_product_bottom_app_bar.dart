import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../data/models/cart_item_model.dart';
import 'buy_button.dart';
import 'total_price.dart';

class BuyProductBottomAppBar extends StatelessWidget {
  const BuyProductBottomAppBar({
    super.key,
    required this.cartItemModelList,
  });

  final List<CartItemModel> cartItemModelList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      color: kWhiteColor,
      child: Column(
        children: [
          TotalPrice(cartItemModelList: cartItemModelList),
          const Gap(12),
          BuyButton(cartItemModelList: cartItemModelList),
        ],
      ),
    );
  }
}

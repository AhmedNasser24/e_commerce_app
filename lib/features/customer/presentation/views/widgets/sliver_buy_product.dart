import 'package:flutter/material.dart';

import '../../../data/models/cart_item_model.dart';
import 'buy_button.dart';
import 'total_price.dart';

class SliverBuyProduct extends StatelessWidget {
  const SliverBuyProduct({
    super.key,
    required this.cartItemModelList,
  });

  final List<CartItemModel> cartItemModelList;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
        child: Row(
          children: [
            BuyButton(cartItemModelList: cartItemModelList),
            const Spacer(),
            TotalPrice(cartItemModelList: cartItemModelList),
          ],
        ),
      ),
    );
  }
}

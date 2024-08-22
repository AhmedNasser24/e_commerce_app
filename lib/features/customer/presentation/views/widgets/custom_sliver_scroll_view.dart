import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../data/models/cart_item_model.dart';
import 'cart_item.dart';
import 'sliver_buy_product.dart';

class CustomSliverScrollView extends StatelessWidget {
  const CustomSliverScrollView({
    super.key,
    required this.cartItemModelList,
  });
  final List<CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.builder(
          itemCount: cartItemModelList.length,
          itemBuilder: (context, i) {
            return CartItem(
              cartItemModel: cartItemModelList[i],
            );
          },
        ),
        const SliverGap(20),
        cartItemModelList.isEmpty
            ? const SliverGap(0)
            : SliverBuyProduct(cartItemModelList: cartItemModelList),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import '../../../../../core/widgets/product_image_positioned.dart';
import '../../../data/models/cart_item_model.dart';
import 'cart_item_details.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, left: 8, top: 120),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CartItemDetails(cartItemModel: cartItemModel),
            ),
          ),
          CustomProductImagePositioned(imageUrl:cartItemModel.productItemModel.imageUrl!),
        ],
      ),
    );
  }
}

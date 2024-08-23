import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/order_item_details.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/product_image_positioned.dart';

class OrdersItemCard extends StatelessWidget {
  const OrdersItemCard({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;
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
              child: OrderItemDetails(productItemModel: productItemModel),
            ),
          ),
          CustomProductImagePositioned(imageUrl: productItemModel.imageUrl!),
        ],
      ),
    );
  }
}

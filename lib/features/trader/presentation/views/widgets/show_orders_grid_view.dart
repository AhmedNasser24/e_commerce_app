
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/orders_item.dart';
import 'package:flutter/material.dart';

class ShowOrdersGridView extends StatelessWidget {
  const ShowOrdersGridView({
    super.key,
    required this.productItemModelList, required this.crossAxisCount,
  });

  final List<ProductItemModel> productItemModelList;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 0.62,
          crossAxisSpacing: 15,
          mainAxisSpacing: 12,
        ),
        itemCount: productItemModelList.length,
        itemBuilder: (context, i) =>
            OrderItem(productItemModel: productItemModelList[i]),
      ),
    );
  }
}
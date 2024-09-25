import 'package:e_commerce/features/trader/presentation/views/widgets/orders_item_card.dart';
import 'package:flutter/material.dart';

import '../../../../../core/models/product_item_model.dart';

class ShowOrdersViewBody extends StatelessWidget {
  const ShowOrdersViewBody({super.key, required this.productItemModelList});
  final List<ProductItemModel> productItemModelList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: productItemModelList.length,
      itemBuilder: (context, i) =>
          OrderItem(productItemModel: productItemModelList[i]),
    );
  }
}

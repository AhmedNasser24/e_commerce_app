import 'package:flutter/material.dart';

import '../../../../../core/models/product_item_model.dart';
import 'responsive_show_orders_grid_view.dart';

class ShowOrdersViewBody extends StatelessWidget {
  const ShowOrdersViewBody({super.key, required this.productItemModelList});
  final List<ProductItemModel> productItemModelList;
  @override
  Widget build(BuildContext context) {
    return ResponsiveShowOrdersGridView(productItemModelList: productItemModelList);
  }
}



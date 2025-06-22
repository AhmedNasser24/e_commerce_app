import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:flutter/material.dart';

import 'responsive_show_orders_grid_view.dart';

class ShowOrdersViewBody extends StatelessWidget {
  const ShowOrdersViewBody({super.key, required this.buyProductModel});
  final BuyProductModel buyProductModel;

  @override
  Widget build(BuildContext context) {
    return ResponsiveShowOrdersGridView(buyProductModel: buyProductModel);
  }
}



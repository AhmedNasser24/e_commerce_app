
import 'dart:developer';

import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/show_orders_grid_view.dart';
import 'package:flutter/material.dart';

class ResponsiveShowOrdersGridView extends StatelessWidget {
  const ResponsiveShowOrdersGridView({
    super.key,
    required this.buyProductModel,
  });

  final BuyProductModel buyProductModel;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    log("screenWidth : $screenWidth");
    if (screenWidth < 500) {
      return ShowOrdersGridView(buyProductModel: buyProductModel , crossAxisCount: 2);
    } else if (screenWidth < 750) {
      return ShowOrdersGridView(buyProductModel: buyProductModel , crossAxisCount: 3);
    } else if (screenWidth < 1000) {
      return ShowOrdersGridView(buyProductModel: buyProductModel , crossAxisCount: 4);
    } else if (screenWidth < 1250) {
      return ShowOrdersGridView(buyProductModel: buyProductModel , crossAxisCount: 5);
    } else {
      return ShowOrdersGridView(buyProductModel: buyProductModel , crossAxisCount: 6);
    }

  }
}
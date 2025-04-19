
import 'dart:developer';

import 'package:e_commerce/features/trader/presentation/views/widgets/trader_product_card_listview.dart';
import 'package:flutter/material.dart';

class ResponsiveProductItemListView extends StatelessWidget {
  const ResponsiveProductItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    log("screenWidth : $screenWidth");
    if (screenWidth < 500) {
      return TraderProductItemListView(crossAxisCount: 2);
    } else if (screenWidth < 750) {
      return TraderProductItemListView(crossAxisCount: 3);
    } else if (screenWidth < 1000) {
      return TraderProductItemListView(crossAxisCount: 4);
    } else if (screenWidth < 1250) {
      return TraderProductItemListView(crossAxisCount: 5);
    } else {
      return TraderProductItemListView(crossAxisCount: 6);
    }
  }
}
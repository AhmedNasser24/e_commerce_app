import 'dart:developer';

import 'package:e_commerce/features/customer/presentation/views/widgets/customer_product_item_list_view.dart';
import 'package:flutter/material.dart';

class ResponsiveCustomerProductItemListView extends StatelessWidget {
  const ResponsiveCustomerProductItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    log("$screenWidth");
    if (screenWidth < 500) {
      return CustomerProductItemListView(crossAxisCount: 2);
    } else if (screenWidth < 750) {
      return CustomerProductItemListView(crossAxisCount: 3);
    } else if (screenWidth < 1000) {
      return CustomerProductItemListView(crossAxisCount: 4);
    } else if (screenWidth < 1250) {
      return CustomerProductItemListView(crossAxisCount: 5);
    } else {
      return CustomerProductItemListView(crossAxisCount: 6);
    }
  }
}


import 'dart:developer';

import 'package:e_commerce/features/customer/data/models/cart_item_model.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/custom_cart_Item_list_view.dart';
import 'package:flutter/material.dart';

class ResponsiveCartItemGridView extends StatelessWidget {
  const ResponsiveCartItemGridView({
    super.key, required this.cartItemModelList,
  });
  final List <CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    log("screenWidth : $screenWidth");
    if (screenWidth < 400) {
      return CustomCartItemListView(crossAxisCount: 1, cartItemModelList: cartItemModelList);
    } else if (screenWidth < 750) {
      return CustomCartItemListView(crossAxisCount: 2, cartItemModelList: cartItemModelList);
    } else if (screenWidth < 1100) {
      return CustomCartItemListView(crossAxisCount: 3, cartItemModelList: cartItemModelList);
    } else if (screenWidth < 1400) {
      return CustomCartItemListView(crossAxisCount: 4, cartItemModelList: cartItemModelList);
    } else {
      return CustomCartItemListView(crossAxisCount: 5, cartItemModelList: cartItemModelList);
    }
  }
}
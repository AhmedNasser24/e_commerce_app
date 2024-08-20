import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'customer_menu_icon_button.dart';
import 'my_shopping_cart_icon_button.dart';
import 'reload_icon_button_for_customer.dart';
import 'show_category_popup_menu_for_customer.dart';

AppBar customerAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text(S.of(context).shop),
    // centerTitle: true,
    leading: CustomerMenuIconButton(scaffoldKey: scaffoldKey),
    actions: [
      const MyShoppingCartIconButton(),
      const ReloadIconButtonForCustomer(),
      showCategoryPopUpMenuForCustomer(context),
    ],
  );
}



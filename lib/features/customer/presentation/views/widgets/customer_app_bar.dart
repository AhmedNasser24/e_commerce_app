import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/utils/app_style.dart';
import 'add_to_cart_button.dart';
import 'customer_menu_icon_button.dart';
import 'show_category_popup_menu_for_customer.dart';

AppBar customerAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text(AppLocalizations.of(context)!.shop, style: AppStyle.medium22),
    // centerTitle: true,
    leading: CustomerMenuIconButton(scaffoldKey: scaffoldKey),
    actions: [
      const AddToCartButton(),
      showCategoryPopUpMenuForCustomer(context),
    ],
  );
}

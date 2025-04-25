import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import 'menu_icon_button_for_trader_view.dart';
import 'show_category_pop_up_menu_for_trader.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

AppBar traderAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text(AppLocalizations.of(context)!.my_shop, style: AppStyle.medium22),
    centerTitle: true,
    leading: MenuIconButtonForTraderView(scaffoldKey: scaffoldKey),
    actions: [
      // const ReloadIconButtonForTrader(),
      showCategoryPopUpMenuForTrader(context),
    ],
  );
}




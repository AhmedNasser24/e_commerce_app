import 'package:flutter/material.dart';
import 'show_category_pop_up_menu_for_trader.dart';
import '../../../../../generated/l10n.dart';
import 'menu_icon_button.dart';
import 'reload_icon_button_for_trader.dart';

AppBar traderAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text(S.of(context).my_shop),
    centerTitle: true,
    leading: MenuIconButton(scaffoldKey: scaffoldKey),
    actions: [
      const ReloadIconButtonForTrader(),
      showCategoryPopUpMenuForTrader(context),
    ],
  );
}




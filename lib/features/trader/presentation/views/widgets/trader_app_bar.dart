import 'package:flutter/material.dart';
import '../../../../../core/functions/show_category_pop_up_menu.dart';
import '../../../../../generated/l10n.dart';

AppBar traderAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.white,
    title: Text(S.of(context).my_shop),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        color: Colors.black,
        size: 30,
      ),
    ),
    actions: [
      showCategoryPopUpMenu(context),
    ],
  );
}

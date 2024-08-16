import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../core/functions/list_of_product_category.dart';
import '../../../../../generated/l10n.dart';

AppBar traderAppBar(BuildContext context , GlobalKey < ScaffoldState> scaffoldKey) {
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
      _showCategoryPopUpMenu(context),
    ],
  );
}

Widget _showCategoryPopUpMenu(context) {
  
  return PopupMenuButton<String>(
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black,
      size: 30,
    ),
    itemBuilder: (BuildContext context) {
      return categoryList(context).map((String category) {
        return PopupMenuItem<String>(
          value: category,
          child: Text(category),
        );
      }).toList();
    },
    onSelected: (String category) {
      log('Selected category: $category');
    },
  );
}

  import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';

AppBar traderAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Text(S.of(context).my_shop),
      centerTitle: true,
      leading: _showCategoryPopUpMenu(context),
    );
  }

  Widget _showCategoryPopUpMenu(context) {
    List<String> categoryList = [
      S.of(context).electronics_category,
      S.of(context).clothes_category,
      S.of(context).shoes_category,
      S.of(context).jewellary_category,
    ];
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.arrow_drop_down,
        color: Colors.black,
        size: 30,
      ),
      itemBuilder: (BuildContext context) {
        return categoryList.map((String category) {
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
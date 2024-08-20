import 'dart:developer';

import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import 'list_of_product_category.dart';

Widget showCategoryPopUpMenu(context) {
  List < String > categoriesList = [S.of(context).all_category];
  categoriesList.addAll(categoryList(context));
  return PopupMenuButton<String>(
    icon: const Icon(
      Icons.arrow_drop_down,
      color: Colors.black,
      size: 30,
    ),
    itemBuilder: (BuildContext context) {
      return categoriesList.map((String category) {
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

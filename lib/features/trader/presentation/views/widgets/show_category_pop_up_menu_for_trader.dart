import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/functions/list_of_product_category.dart';

Widget showCategoryPopUpMenuForTrader(context) {
  List<String> categoriesList = [AppLocalizations.of(context)!.all_category];
  categoriesList.addAll(categoryList(context));
  return PopupMenuButton<String>(
    icon: const Icon(
      Icons.arrow_drop_down,
      color: kPurpleColor,
      size: 30,
    ),
    itemBuilder: (BuildContext context) {
      return categoriesList.map((String category) {
        return PopupMenuItem<String>(
          value: category,
          child: Text(category , style: AppStyle.medium14),
        );
      }).toList();
    },
    onSelected: (String category) {
      BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
          .fetchCategoryProductsForTrader(category: category);
    },
  );
}

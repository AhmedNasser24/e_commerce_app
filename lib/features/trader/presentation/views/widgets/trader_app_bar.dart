import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/show_category_pop_up_menu.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/fetch_trader_product_only_cubit/fetch_trader_product_only_cubit.dart';

AppBar traderAppBar(
    BuildContext context, GlobalKey<ScaffoldState> scaffoldKey){
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
      IconButton(
        onPressed: () async{
          BlocProvider.of<FetchTraderProductOnlyCubit>(context)
              .fetchTraderProductOnly();
        },
        icon: const Icon(Icons.refresh),
      ),
      showCategoryPopUpMenu(context),
    ],
  );
}

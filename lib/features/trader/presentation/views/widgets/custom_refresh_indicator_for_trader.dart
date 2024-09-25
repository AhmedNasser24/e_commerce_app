import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';

class CustomRefreshIndicatorForTrader extends StatelessWidget {
  const CustomRefreshIndicatorForTrader({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        // Code to reload the page
        await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .fetchCategoryProductsForTrader();

        return Future.value(null); // Return null to stop the refresh indicator
      },
    );
  }
}

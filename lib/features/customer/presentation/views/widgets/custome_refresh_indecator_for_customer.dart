import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';

class CustomRefreshIndicatorForCustomer extends StatelessWidget {
  const CustomRefreshIndicatorForCustomer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        // Code to reload the page
        // await Future.delayed(const Duration(seconds: 1)); // Simulate a delay

        await BlocProvider.of<FetchCategoryProductForCustomerCubit>(context)
            .fetchCategoryProductsForCustomer();
        // return Future.value(null); // Return null to stop the refresh indicator
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';


class ReloadIconButtonForCustomer extends StatelessWidget {
  const ReloadIconButtonForCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        BlocProvider.of<FetchCategoryProductForCustomerCubit>(context)
            .fetchCategoryProductsForCustomer();
      },
      icon: const Icon(Icons.refresh),
    );
  }
}

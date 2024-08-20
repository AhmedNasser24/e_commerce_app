import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../customer_home_view.dart';

class CustomerHomeViewBlocProvider extends StatelessWidget {
  const CustomerHomeViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchCategoryProductForCustomerCubit(),
      child: const CustomerHomeView(),
    );
  }
}
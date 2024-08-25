import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../customer_home_view.dart';

class CustomerHomeViewBlocProvider extends StatelessWidget {
  const CustomerHomeViewBlocProvider({super.key, required this.changeLanguage});
  final void Function(Locale newLocale) changeLanguage;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchCategoryProductForCustomerCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child:  CustomerHomeView(changeLanguage: changeLanguage),
    );
  }
}

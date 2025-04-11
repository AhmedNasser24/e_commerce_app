import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/data/repos/auth_repo.dart';
import '../../../../auth/presentation/manager/login_cubit/login_cubit.dart';
import '../../../../auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import '../customer_home_view.dart';

class CustomerHomeViewBlocProvider extends StatelessWidget {
  const CustomerHomeViewBlocProvider({super.key,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FetchCategoryProductForCustomerCubit(getIt<CustomerRepo>()),
        ),
        BlocProvider(
          create: (context) => SignOutCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
        ),
      ],
      child: const CustomerHomeView(),
    );
  }
}

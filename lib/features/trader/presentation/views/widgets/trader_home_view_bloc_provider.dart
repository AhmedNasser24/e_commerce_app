// import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:e_commerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../auth/data/repos/auth_repo.dart';
import '../../../../auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import '../trader_home_view.dart';

class TraderHomeViewBlocProvider extends StatelessWidget {
  const TraderHomeViewBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignOutCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
        ),
      ],
      child: const TraderHomeView(),
    );
  }
}

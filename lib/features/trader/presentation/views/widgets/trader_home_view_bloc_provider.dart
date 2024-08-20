import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_trader_product_only_cubit/fetch_trader_product_only_cubit.dart';
import '../trader_home_view.dart';

class TraderHomeViewBlocProvider extends StatelessWidget {
  const TraderHomeViewBlocProvider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FetchTraderProductOnlyCubit(),
      child: const TraderHomeView(),
    );
  }
}

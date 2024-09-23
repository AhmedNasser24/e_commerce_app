// import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../trader_home_view.dart';

class TraderHomeViewBlocProvider extends StatelessWidget {
  const TraderHomeViewBlocProvider({
    super.key, required this.changeLanguage,
  });
  final void Function(Locale newLocale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    return 
    // BlocProvider(
    //   create: (context) => FetchCategoryProductsForTraderCubit(),
    //   child:  
      TraderHomeView(changeLanguage: changeLanguage);
    // );
  }
}

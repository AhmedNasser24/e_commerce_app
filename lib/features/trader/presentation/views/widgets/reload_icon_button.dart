import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';

class ReloadIconButton extends StatelessWidget {
  const ReloadIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .fetchCategoryProductsForTrader();
      },
      icon: const Icon(Icons.refresh),
    );
  }
}

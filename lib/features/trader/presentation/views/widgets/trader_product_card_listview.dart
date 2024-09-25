import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'custom_refresh_indicator_for_trader.dart';
import 'trader_product_item.dart';

class TraderProductItemListView extends StatelessWidget {
  const TraderProductItemListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryProductsForTraderCubit,
        FetchCategoryProductsForTraderState>(
      builder: (context, state) {
        if (state is FetchCategoryProductsForTraderSuccess) {
          return CustomRefreshIndicatorForTrader(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.62,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 12,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: state.productItemModelList.length,
                itemBuilder: (context, i) {
                  return TraderProductItem(
                      productItemModel: state.productItemModelList[i]);
                },
              ),
            ),
          );
        } else if (state is FetchCategoryProductsForTraderFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

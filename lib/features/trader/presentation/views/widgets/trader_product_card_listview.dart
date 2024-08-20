import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'trader_product_card.dart';

class TraderProductCardListView extends StatelessWidget {
  const TraderProductCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryProductsForTraderCubit,
        FetchCategoryProductsForTraderState>(
      builder: (context, state) {
        if (state is FetchCategoryProductsForTraderSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.productItemModelList.length,
            itemBuilder: (context, i) {
              return TraderProductCard(
                  productItemModel: state.productItemModelList[i]);
            },
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

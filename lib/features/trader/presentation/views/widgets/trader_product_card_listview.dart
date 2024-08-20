import 'dart:developer';

import 'package:e_commerce/features/trader/presentation/manager/fetch_trader_product_only_cubit/fetch_trader_product_only_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'trader_product_card.dart';

class TraderProductCardListView extends StatelessWidget {
  const TraderProductCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchTraderProductOnlyCubit,
        FetchTraderProductOnlyState>(
      builder: (context, state) {
        if (state is FetchTraderProductOnlySuccess) {
          log('succeed');
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.productItemModelList.length,
            itemBuilder: (context, i) {
              log(state.productItemModelList[i].name!);
              return TraderProductCard(
                  productItemModel: state.productItemModelList[i]);
            },
          );
        } else if (state is FetchTraderProductOnlyFailure) {
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

import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/core/widgets/custom_model_progress_hud.dart';
import 'package:e_commerce/core/widgets/error_message_widget.dart';
import 'package:e_commerce/core/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/l10n/app_localizations.dart';

import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import '../product_details_view_for_trader.dart';
import 'trader_product_item.dart';

class TraderProductItemListView extends StatelessWidget {
  const TraderProductItemListView({
    super.key,
    required this.crossAxisCount,
  });
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryProductsForTraderCubit,
        FetchCategoryProductsForTraderState>(
      builder: (context, state) {
        if (state is FetchCategoryProductsForTraderSuccess) {
          List<ProductItemModel> productItemModelList =
              state.productItemModelList;
          return productItemModelList.isEmpty
              ? MessageWidget(AppLocalizations.of(context)!.empty)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 12,
                    ),
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: state.productItemModelList.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                          context,
                          ProductDetailsViewForTrader.routeName,
                          arguments: {
                            'productItemModel': productItemModelList[i],
                            'index': i,
                          },
                        ),
                        child: TraderProductItem(
                            productItemModel: productItemModelList[i],
                            index: i),
                      );
                    },
                  ),
                );
        } else if (state is FetchCategoryProductsForTraderFailure) {
          return ErrorMessageWidget(errMessage: state.errMessage);
        } else if (state is FetchCategoryProductsForTraderLoading) {
          List<ProductItemModel> productItemModelList =
              BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
                  .productItemModelList;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomModalProgressHud(
              isLoading: true,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.62,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 12,
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: productItemModelList.length,
                itemBuilder: (context, i) {
                  return TraderProductItem(
                      productItemModel: productItemModelList[i], index: i);
                },
              ),
            ),
          );

        }
        else {
          return const SizedBox() ;
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

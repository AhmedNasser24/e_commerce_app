import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/core/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../customer/presentation/views/widgets/add_to_cart_view_body.dart';
import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import '../product_details_view_for_trader.dart';
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
          List<ProductItemModel> productItemModelList =
              state.productItemModelList;
          return productItemModelList.isEmpty
              ? MessageWidget(LocaleKeys.empty.tr())
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 12,
                    ),
                    // physics: const BouncingScrollPhysics(),
                    itemCount: state.productItemModelList.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailsViewForTrader(
                                productItemModel: productItemModelList[i]),
                          ),
                        ),
                        child: TraderProductItem(
                            productItemModel: productItemModelList[i]),
                      );
                    },
                  ),
                );
        } else if (state is FetchCategoryProductsForTraderFailure) {
          return ErrorMessageWidget(errMessage: state.errMessage);
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

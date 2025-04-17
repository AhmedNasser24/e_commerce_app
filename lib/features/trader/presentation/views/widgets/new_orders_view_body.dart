import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/widgets/message_widget.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../customer/data/models/buy_product_model.dart';
import 'custom_refresh_indicator_for_trader.dart';
import 'order_items_list_view.dart';

class NewOrdersViewBody extends StatelessWidget {
  const NewOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomRefreshIndicatorForTrader(
      
      child: BlocBuilder<FetchNewOrdersCubit, FetchNewOrdersState>(
        builder: (context, state) {
          List<BuyProductModel> buyProductModelList =
              BlocProvider.of<FetchNewOrdersCubit>(context).buyProductModelList;
          if (state is FetchNewOrdersSuccess) {
            return buyProductModelList.isEmpty ? MessageWidget(LocaleKeys.empty.tr()) : OrderItemsListView(
                buyProductModelList: state.buyProductModelList);
          } else if (state is FetchNewOrdersFailure) {
            showSnackBar(context, state.errMessage);
            return OrderItemsListView(
                buyProductModelList: buyProductModelList);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


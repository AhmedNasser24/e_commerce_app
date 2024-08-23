import 'package:e_commerce/features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/new_order_item.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/show_orders_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../customer/data/models/buy_product_model.dart';

class NewOrderItemsListView extends StatelessWidget {
  const NewOrderItemsListView({
    super.key,
    required this.buyProductModelList,
  });
  final List<BuyProductModel> buyProductModelList;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: buyProductModelList.length,
      itemBuilder: (context, i) => NewOrderItem(
        buyProductModel: buyProductModelList[i],
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ShowOrdersView()));
          BlocProvider.of<FetchNewOrdersCubit>(context)
              .changeOrderFromNewToOld(buyProductModel: buyProductModelList[i]);
        },
      ),
    );
  }
}

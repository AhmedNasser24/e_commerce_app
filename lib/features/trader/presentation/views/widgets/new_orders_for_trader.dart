import 'package:e_commerce/features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'new_order_list_tile.dart';

class NewOrdersForTrader extends StatelessWidget {
  const NewOrdersForTrader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<FetchNewOrdersCubit, FetchNewOrdersState>(
      builder: (context, state) {
        bool isThereNewOrder = BlocProvider.of<FetchNewOrdersCubit>(context).isthereNewOrder; 
        return NewOrderListTile(isActive: isThereNewOrder);
      },
    );
  }
}

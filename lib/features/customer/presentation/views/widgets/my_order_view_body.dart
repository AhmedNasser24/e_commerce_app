import 'package:e_commerce/features/customer/presentation/manager/my_order_cubit/my_order_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/my_order_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/my_order_item_model.dart';

class MyOrderViewBody extends StatelessWidget {
  const MyOrderViewBody({super.key, required this.myOrderItemModelList});

  final List<MyOrderItemModel> myOrderItemModelList;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        // Code to reload the page
        await Future.delayed(const Duration(seconds: 1)); // Simulate a delay
        BlocProvider.of<MyOrderCubit>(context).fetchMyOrderItems();
        return Future.value(null); // Return null to stop the refresh indicator
      },
      child: ListView.builder(
        itemCount: myOrderItemModelList.length,
        itemBuilder: (context, i) =>
            MyOrderItem(myOrderItemModel: myOrderItemModelList[i]),
      ),
    );
  }
}

import 'package:e_commerce/features/customer/presentation/manager/my_order_cubit/my_order_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/my_order_item.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/message_widget.dart';
import '../../../data/models/my_order_item_model.dart';

class MyOrderViewBody extends StatelessWidget {
  const MyOrderViewBody({super.key, required this.myOrderItemModelList});

  final List<MyOrderItemModel> myOrderItemModelList;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await BlocProvider.of<MyOrderCubit>(context).fetchMyOrderItems();
      },
      child: myOrderItemModelList.isNotEmpty
          ? ListView.builder(
              itemCount: myOrderItemModelList.length,
              itemBuilder: (context, i) =>
                  MyOrderItem(myOrderItemModel: myOrderItemModelList[i]),
            )
          : MessageWidget(AppLocalizations.of(context)!.all_last_orders_have_been_delivered_to_you),
    );
  }
}


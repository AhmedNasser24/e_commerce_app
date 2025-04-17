import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../../trader/presentation/views/widgets/back_arrow_button.dart';
import '../../manager/my_order_cubit/my_order_cubit.dart';
import 'my_order_view_body.dart';
import 'not_delivered_text.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyOrderCubit, MyOrderState>(
      builder: (context, state) {
        if (state is MyOrderSuccess) {
          return Scaffold(
            body: SafeArea(
                child: MyOrderViewBody(
                    myOrderItemModelList: state.myOrderItemModelList)),
            appBar: myOrderAppBar(context),
            bottomNavigationBar: state.myOrderItemModelList.isEmpty? null : const CustomBottomAppBar(),
          );
        } else if (state is MyOrderFailure) {
          return Scaffold(
            body: SafeArea(
              child: Center(
                child: Text(
                  state.errMessage,
                  style: AppStyle.medium16.copyWith(color: Colors.red),
                ),
              ),
            ),
            appBar: myOrderAppBar(context),
          );
        } else {
          return Scaffold(
            body: const SafeArea(
              child:
                  Center(child: CircularProgressIndicator(color: kPurpleColor)),
            ),
            appBar: myOrderAppBar(context),
          );
        }
      },
    );
  }

  AppBar myOrderAppBar(BuildContext context) {
    return AppBar(
      leading: const BackArrowButton(
        color: kWhiteColor,
      ),
      title: Text(LocaleKeys.my_orders.tr(), style: AppStyle.medium22.copyWith(color: kWhiteColor)),
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kPurpleColor,
    );
  }
}

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kPurpleColor,
      child: Row(
        children: [
          Text(
              "${BlocProvider.of<MyOrderCubit>(context).totPrice} ${LocaleKeys.LE.tr()}",
              style: AppStyle.semiBold18.copyWith(color: kWhiteColor)),
          const Spacer(),
          const NotDeliveredText(),
        ],
      ),
    );
  }
}

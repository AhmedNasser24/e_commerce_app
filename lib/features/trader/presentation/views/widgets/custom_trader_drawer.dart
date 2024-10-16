import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import '../../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'new_orders_for_trader.dart';

class CustomTraderDrawer extends StatelessWidget {
  const CustomTraderDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? traderName = BlocProvider.of<AuthCubit>(context).userInfo?.name ?? "No Account";
    return  Drawer(
      backgroundColor : kOffWhiteColor,
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              traderName,
              style: AppStyle.semiBold22,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const NewOrdersForTrader(),
          // const OldOrdersForTrader(),
          const SelectLanguage(),
          const SignOut(),
        ],
      ),
    );
  }
}





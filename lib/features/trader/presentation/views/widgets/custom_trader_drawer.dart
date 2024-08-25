import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import '../../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'new_orders_for_trader.dart';
import 'old_orders_for_trader.dart';

class CustomTraderDrawer extends StatelessWidget {
  const CustomTraderDrawer({
    super.key, required this.changeLanguage,
  });
  final void Function(Locale newLocale) changeLanguage;

  @override
  Widget build(BuildContext context) {
    String traderName = BlocProvider.of<AuthCubit>(context).userInfo.name! ;
    return  Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              traderName,
              style: AppStyle.semiBold22,
            ),
          ),
          const NewOrdersForTrader(),
          const OldOrdersForTrader(),
          SelectLanguage(changeLanguage: changeLanguage),
          SignOut(changeLanguage: changeLanguage),
        ],
      ),
    );
  }
}





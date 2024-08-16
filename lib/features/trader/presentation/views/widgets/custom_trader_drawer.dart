import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import 'new_orders_for_trader.dart';
import 'old_orders_for_trader.dart';

class CustomTraderDrawer extends StatelessWidget {
  const CustomTraderDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              "Trader Name",
              style: AppStyle.semiBold22,
            ),
          ),
          NewOrdersForTrader(),
          OldOrdersForTrader(),
          SelectLanguage(),
          SignOut()
        ],
      ),
    );
  }
}





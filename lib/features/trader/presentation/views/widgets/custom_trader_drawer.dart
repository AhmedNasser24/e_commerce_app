import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import 'new_orders_for_trader.dart';
import 'trader_drawer_header.dart';

class CustomTraderDrawer extends StatelessWidget {
  const CustomTraderDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  const Drawer(
      backgroundColor : kOffWhiteColor,
      child: Column(
        children: [
          TraderDrawerHeader(),
          NewOrdersForTrader(),
          // const OldOrdersForTrader(),
          SelectLanguage(),
          SignOut(),
        ],
      ),
    );
  }
}





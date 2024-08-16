import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/custom_trader_drawer.dart';
import 'widgets/trader_app_bar.dart';
import 'widgets/trader_body.dart';

class TraderView extends StatefulWidget {
  const TraderView({super.key});

  @override
  State<TraderView> createState() => _TraderViewState();
}

class _TraderViewState extends State<TraderView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kScaffoldColor,
      body: const TraderViewBody(),
      appBar: traderAppBar(context, scaffoldKey),
      floatingActionButton: const CustomFloatingActionButton(),
      drawer: const CustomTraderDrawer(),
    );
  }
}

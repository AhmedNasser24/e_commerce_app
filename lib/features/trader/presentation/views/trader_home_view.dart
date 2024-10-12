import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/custom_trader_drawer.dart';
import 'widgets/trader_app_bar.dart';
import 'widgets/trader_home_body.dart';

class TraderHomeView extends StatefulWidget {
  const TraderHomeView({super.key,});

  @override
  State<TraderHomeView> createState() => _TraderHomeViewState();
}

class _TraderHomeViewState extends State<TraderHomeView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    BlocProvider.of<FetchNewOrdersCubit>(context).fetchNewOrdersForTrader() ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: kScaffoldColor,
      body:  const TraderHomeViewBody(),
      
      appBar: traderAppBar(context, scaffoldKey),
      floatingActionButton: const CustomFloatingActionButton(),
      drawer:  const SafeArea(child: CustomTraderDrawer()),
    );
  }
}

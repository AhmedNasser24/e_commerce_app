import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_floating_action_button.dart';
import 'widgets/trader_app_bar.dart';
import 'widgets/trader_body.dart';

class TraderView extends StatelessWidget {
  const TraderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: const TraderViewBody(),
      appBar: traderAppBar(context),
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}


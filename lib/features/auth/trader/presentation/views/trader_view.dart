import 'package:flutter/material.dart';
import 'widgets/trader_app_bar.dart';
import 'widgets/trader_body.dart';


class TraderView extends StatelessWidget {
  const TraderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const TraderBody(),
      appBar: traderAppBar(context),
    );
  }
}

import 'package:flutter/material.dart';

import 'widgets/trader_body.dart';

class TraderView extends StatelessWidget {
  const TraderView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TraderBody(),
    );
  }
}

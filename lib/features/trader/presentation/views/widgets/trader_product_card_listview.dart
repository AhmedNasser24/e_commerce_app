import 'package:flutter/material.dart';

import 'trader_product_card.dart';

class TraderProductCardListView extends StatelessWidget {
  const TraderProductCardListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      
      itemBuilder: (context, i) => const TraderProductCard(),
    );
  }
}

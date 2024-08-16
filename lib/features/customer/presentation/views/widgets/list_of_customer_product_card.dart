import 'package:flutter/material.dart';

import 'customer_product_card.dart';

class ListOfCustomerProductCard extends StatelessWidget {
  const ListOfCustomerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) => const CustomerProductCard(),
    );
  }
}

import 'package:flutter/material.dart';
import 'new_order_item.dart';

class NewOrdersViewBody extends StatelessWidget {
  const NewOrdersViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, i) => NewOrderItem(isNew: i == 1),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class CustomerOrder extends StatelessWidget {
  const CustomerOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).my_orders,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.shopping_cart),
    );
  }
}

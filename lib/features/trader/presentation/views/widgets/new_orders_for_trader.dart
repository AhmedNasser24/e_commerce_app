import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../new_orders_view.dart';

class NewOrdersForTrader extends StatelessWidget {
  const NewOrdersForTrader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const NewOrdersView()));
      },
      title: Text(
        S.of(context).new_orders,
        style: AppStyle.semiBold16.copyWith(color: Colors.green),
      ),
      leading: const Icon(
        Icons.notification_add,
        color: Colors.green,
      ),
      trailing: Text(
        S.of(context).news,
        style: AppStyle.semiBold16.copyWith(color: Colors.green),
      ),
    );
  }
}

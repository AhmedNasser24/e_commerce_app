import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class NewOrdersForTrader extends StatelessWidget {
  const NewOrdersForTrader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).new_orders,
        style: AppStyle.semiBold16.copyWith(color: Colors.green),
      ),
      leading: const Icon(
        Icons.notification_add,
        color: Colors.green,
      ),
      trailing: Text(
        "new",
        style: AppStyle.semiBold16.copyWith(color: Colors.green),
      ),
    );
  }
}

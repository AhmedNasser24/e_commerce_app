
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class OldOrdersForCustomer extends StatelessWidget {
  const OldOrdersForCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).old_orders,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.history),
    );
  }
}


import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class OldOrdersForTrader extends StatelessWidget {
  const OldOrdersForTrader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).old_orders,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.history , color: kPurpleColor),
    );
  }
}

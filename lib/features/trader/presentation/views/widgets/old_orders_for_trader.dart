import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OldOrdersForTrader extends StatelessWidget {
  const OldOrdersForTrader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        LocaleKeys.old_orders.tr(),
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.history , color: kPurpleColor),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/utils/app_style.dart';

class OldOrdersForCustomer extends StatelessWidget {
  const OldOrdersForCustomer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.old_orders,
          style: AppStyle.semiBold16),
      leading: const Icon(Icons.history),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

import '../new_orders_view.dart';

class NewOrderListTileButton extends StatelessWidget {
  const NewOrderListTileButton({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          NewOrdersView.routeName,
        );
      },
      title: Text(
        AppLocalizations.of(context)!.new_orders,
        style: isActive
            ? AppStyle.semiBold16.copyWith(color: Colors.green)
            : AppStyle.semiBold16,
      ),
      leading: isActive
          ? const Icon(
              Icons.notification_add,
              color: Colors.green,
            )
          : const Icon(
              Icons.notifications,
              color : kPurpleColor
            ),
      trailing: isActive
          ? Text(
              AppLocalizations.of(context)!.news,
              style: AppStyle.semiBold16.copyWith(color: Colors.green),
            )
          : null,
    );
  }
}

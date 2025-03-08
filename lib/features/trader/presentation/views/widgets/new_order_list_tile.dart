import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../new_orders_view.dart';

class NewOrderListTile extends StatelessWidget {
  const NewOrderListTile({
    super.key,
    required this.isActive,
  });
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const NewOrdersView(),
          ),
        );
      },
      title: Text(
        LocaleKeys.new_orders.tr(),
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
              LocaleKeys.news.tr(),
              style: AppStyle.semiBold16.copyWith(color: Colors.green),
            )
          : null,
    );
  }
}

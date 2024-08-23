
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
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
        S.of(context).new_orders,
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
            ),
      trailing: isActive
          ? Text(
              S.of(context).news,
              style: AppStyle.semiBold16.copyWith(color: Colors.green),
            )
          : null,
    );
  }
}

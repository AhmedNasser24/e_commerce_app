import 'package:flutter/material.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import 'customer_drawer_header.dart';
import 'customer_order.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Column(
        children: [
          CustomerDrawerHeader(),
          MyOrders(),
          SelectLanguage(),
          SignOut(),
        ],
      ),
    );
  }
}

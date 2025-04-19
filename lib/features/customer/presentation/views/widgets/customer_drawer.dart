import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import 'customer_drawer_header.dart';
import 'my_order_drawer_button.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomerDrawerHeader(),
            MyOrdersDrawerButton(),
            SelectLanguage(),
            SignOut(),
            Gap(30),
          ],
        ),
      ),
    );
  }
}

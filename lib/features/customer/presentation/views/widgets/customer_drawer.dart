import 'package:e_commerce/features/customer/presentation/views/widgets/old_orders_for_customer.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
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
          DrawerHeader(
            child: Text(
              "Customer Name",
              style: AppStyle.semiBold22,
            ),
          ),
          CustomerOrder(),
          OldOrdersForCustomer(),
          SelectLanguage(),
          SignOut()
        ],
      ),
    );
  }
}





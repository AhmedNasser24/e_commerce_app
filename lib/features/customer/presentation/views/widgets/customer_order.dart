import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/presentation/views/my_order_view_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        LocaleKeys.my_orders.tr(),
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.shopping_cart, color: kPurpleColor),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MyOrderViewBlocProvider(),
        ),
      ),
    );
  }
}

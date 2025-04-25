import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/presentation/views/my_order_view_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/utils/app_style.dart';

class MyOrdersDrawerButton extends StatelessWidget {
  const MyOrdersDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          AppLocalizations.of(context)!.my_orders,
          style: AppStyle.semiBold16,
        ),
        leading: const Icon(Icons.shopping_cart, color: kPurpleColor),
        onTap: () {
          Navigator.pop(context); // Close the drawer before navigating
          Navigator.pushNamed(
            context,
            MyOrderViewBlocProvider.routeName,
          );
        });
  }
}

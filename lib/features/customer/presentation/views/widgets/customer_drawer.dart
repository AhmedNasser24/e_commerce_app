import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/old_orders_for_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import 'customer_order.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    super.key, required this.changeLanguage, 
  });
  final void Function(Locale newLocale) changeLanguage;
  @override
  Widget build(BuildContext context) {
    String customerName = BlocProvider.of<AuthCubit>(context).userInfo.name! ;
    return  Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
              customerName,
              style: AppStyle.semiBold22,
            ),
          ),
          const CustomerOrder(),
          const OldOrdersForCustomer(),
          SelectLanguage(changeLanguage: changeLanguage),
          SignOut(changeLanguage: changeLanguage)
        ],
      ),
    );
  }
}





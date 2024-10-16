import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/select_language.dart';
import '../../../../../core/widgets/sign_out.dart';
import '../../../../auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'customer_order.dart';

class CustomerDrawer extends StatelessWidget {
  const CustomerDrawer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    String? customerName = BlocProvider.of<AuthCubit>(context).userInfo?.name ?? "No Account";
    return  Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text(
             customerName,
              style: AppStyle.semiBold22,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const MyOrders(),
          const SelectLanguage(),
          const SignOut(),
        ],
      ),
    );
  }
}

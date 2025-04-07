
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../auth/presentation/manager/login_cubit/login_cubit.dart';

class CustomerDrawerHeader extends StatefulWidget {
  const CustomerDrawerHeader({
    super.key,
  });

  @override
  State<CustomerDrawerHeader> createState() => _CustomerDrawerHeaderState();
}

class _CustomerDrawerHeaderState extends State<CustomerDrawerHeader> {
  late String customerName;

  @override
  void initState() {
    super.initState(); 
    customerName =
        BlocProvider.of<LoginCubit>(context).userInfo?.name ?? "No Account";
    if (customerName == "No Account") {
      getCustomerName();
    }
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Text(
        customerName,
        style: AppStyle.semiBold22,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future<void> getCustomerName() async {
    await BlocProvider.of<LoginCubit>(context).getUserInfo();
    setState(() {
      customerName =
          BlocProvider.of<LoginCubit>(context).userInfo?.name ?? "No Account";
    });
  }
}

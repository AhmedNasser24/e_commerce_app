
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../auth/presentation/manager/login_cubit/login_cubit.dart';

class TraderDrawerHeader extends StatefulWidget {
  const TraderDrawerHeader({
    super.key,
  });

  @override
  State<TraderDrawerHeader> createState() => _TraderDrawerHeaderState();
}

class _TraderDrawerHeaderState extends State<TraderDrawerHeader> {
  late String traderName;

  @override
  void initState() {
    traderName =
        BlocProvider.of<LoginCubit>(context).userInfo?.name ?? "No Account";
    if (traderName == "No Account") {
      getTraderName();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Text(
        traderName,
        style: AppStyle.semiBold22,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Future<void> getTraderName() async {
    await BlocProvider.of<LoginCubit>(context).getUserInfo();
    setState(() {
      traderName =
          BlocProvider.of<LoginCubit>(context).userInfo?.name ?? "No Account";
    });
  }
}

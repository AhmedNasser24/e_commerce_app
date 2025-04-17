import 'package:e_commerce/features/customer/data/repo/customer_repo.dart';
import 'package:e_commerce/features/customer/presentation/manager/my_order_cubit/my_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/get_it_setup.dart';
import 'widgets/my_order_view.dart';

class MyOrderViewBlocProvider extends StatelessWidget {
  const MyOrderViewBlocProvider({super.key});

  static const String routeName = '/myOrderView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrderCubit(getIt<CustomerRepo>()),
      child: const MyOrderView(),
    );
  }

  
}

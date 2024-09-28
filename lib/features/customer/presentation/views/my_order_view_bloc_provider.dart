import 'package:e_commerce/features/customer/presentation/manager/my_order_cubit/my_order_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widgets/my_order_view.dart';

class MyOrderViewBlocProvider extends StatelessWidget {
  const MyOrderViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyOrderCubit(),
      child: const MyOrderView(),
    );
  }

  
}

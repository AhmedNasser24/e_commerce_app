import 'package:e_commerce/features/trader/presentation/views/add_new_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/add_product_cubit/add_product_cubit.dart';

class AddNewProductViewBlocProvider extends StatelessWidget {
  const AddNewProductViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: const AddNewProductView(),
    );
  }
}
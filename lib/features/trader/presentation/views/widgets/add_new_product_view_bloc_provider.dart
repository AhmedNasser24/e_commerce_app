import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:e_commerce/features/trader/presentation/views/add_new_product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/trader_repo.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';

class AddNewProductViewBlocProvider extends StatelessWidget {
  const AddNewProductViewBlocProvider({super.key});
  static const String routeName = "/addNewProductViewBlocProvider";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(getIt<TraderRepo>()),
      child: const AddNewProductView(),
    );
  }
}
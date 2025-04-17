import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/customer_repo.dart';
import '../add_to_cart_view.dart';

class AddToCardViewBlocProvider extends StatelessWidget {
  const AddToCardViewBlocProvider({super.key});
  static const String routeName = "/addToCardViewBlocProvider";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BuyProductCubit(getIt<CustomerRepo>()),
      child: const AddToCartView(),
    );
  }
}

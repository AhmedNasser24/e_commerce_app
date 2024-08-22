import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cart_cubit/cart_cubit.dart';
import '../add_to_cart_view.dart';

class AddToCardViewBlocProvider extends StatelessWidget {
  const AddToCardViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => BuyProductCubit(),
        ),
      ],
      child: const AddToCartView(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/cart_cubit/cart_cubit.dart';
import '../add_to_cart_view.dart';

class AddToCardViewBlocProvider extends StatelessWidget {
  const AddToCardViewBlocProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: const AddToCartView(),
    );
  }
}

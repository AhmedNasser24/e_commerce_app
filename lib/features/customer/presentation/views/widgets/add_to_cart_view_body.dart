import 'package:e_commerce/core/utils/app_style.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_item.dart';

class AddToCartViewBody extends StatefulWidget {
  const AddToCartViewBody({super.key});

  @override
  State<AddToCartViewBody> createState() => _AddToCartViewBodyState();
}

class _AddToCartViewBodyState extends State<AddToCartViewBody> {
  @override
  void initState() {
    BlocProvider.of<CartCubit>(context).fetchCartItem();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartSuccess) {
          return ListView.builder(
            itemCount: state.cartItemModelList.length,
            itemBuilder: (context, i) {
              return CartItem(
                productItemModel: state.cartItemModelList[i].productItemModel,
              );
            },
          );
        } else if (state is CartFailure) {
          return ShowErrorMessage(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class ShowErrorMessage extends StatelessWidget {
  const ShowErrorMessage({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          errMessage,
          style: AppStyle.medium14.copyWith(color: Colors.red),
        ),
      ),
    );
  }
}

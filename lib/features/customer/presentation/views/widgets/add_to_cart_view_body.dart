import 'package:e_commerce/core/utils/app_style.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_cart_Item_list_view.dart';

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
          return  CustomCartItemListView(cartItemModelList: state.cartItemModelList);
        } else if (state is CartFailure) {
          return ErrorMessageWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}




class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Center(
        child: Text(
          errMessage,
          style: AppStyle.medium14.copyWith(color: Colors.red),
          textAlign: TextAlign.center ,
        ),
      ),
    );
  }
}

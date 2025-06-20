import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/responsive_cart_item_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/error_message_widget.dart';

class AddToCartViewBody extends StatefulWidget {
  const AddToCartViewBody({super.key, required this.isLoading});
  final bool isLoading;
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
          return AbsorbPointer(
            absorbing: widget.isLoading,
            child: RefreshIndicator(
              color: kPurpleColor,
              onRefresh: () async {
                await BlocProvider.of<CartCubit>(context).fetchCartItem();
              },
              child: ResponsiveCartItemGridView(
                  cartItemModelList: state.cartItemModelList ?? []), // cartSuccess sometimes return null  
            ),
          );
        } else if (state is CartFailure) {
          return ErrorMessageWidget(errMessage: state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}


import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'add_to_cart_view_body.dart';
import 'customer_product_card.dart';

class ListOfCustomerProductCard extends StatelessWidget {
  const ListOfCustomerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryProductForCustomerCubit,
        FetchCategoryProductForCustomerState>(
      builder: (context, state) {
        if (state is FetchCategoryProductForCustomerSuccess) {
          return ListView.builder(
            itemCount: state.productItemModelList.length,
            itemBuilder: (context, i) => CustomerProductCard(
                productItemModel: state.productItemModelList[i]),
          );
        } else if (state is FetchCategoryProductForCustomerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchCategoryProductForCustomerFailure) {
          return ShowErrorMessage(errMessage: state.errMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

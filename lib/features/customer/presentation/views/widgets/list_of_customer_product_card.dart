import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/product_item_model.dart';
import 'customer_product_card.dart';

class ListOfCustomerProductCard extends StatelessWidget {
  const ListOfCustomerProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    List<ProductItemModel> productItemModelList = [];
    return BlocConsumer<FetchCategoryProductForCustomerCubit,
        FetchCategoryProductForCustomerState>(
      listener: (context, state) {
        if (state is FetchCategoryProductForCustomerLoading) {
          isLoading = true;
        } else if (state is FetchCategoryProductForCustomerSuccess) {
          isLoading = false;
          productItemModelList = state.productItemModelList;
        } else if (state is FetchCategoryProductForCustomerFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: productItemModelList.length,
                itemBuilder: (context, i) =>  CustomerProductCard(productItemModel : productItemModelList[i] ),
              );
      },
    );
  }
}

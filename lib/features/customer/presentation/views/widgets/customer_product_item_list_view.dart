import 'package:e_commerce/core/widgets/message_widget.dart';
import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../product_details_view_for_customer.dart';
import 'add_to_cart_view_body.dart';
import 'customer_product_card.dart';

class CustomerProductItemListView extends StatelessWidget {
  const CustomerProductItemListView({super.key, required this.crossAxisCount});
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchCategoryProductForCustomerCubit,
        FetchCategoryProductForCustomerState>(
      builder: (context, state) {
        if (state is FetchCategoryProductForCustomerSuccess) {
          return state.productItemModelList.isEmpty
              ? MessageWidget(AppLocalizations.of(context)!.empty)
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      childAspectRatio: 0.62,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: state.productItemModelList.length,
                    itemBuilder: (context, i) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                        context,
                        ProductDetailsViewForCustomer.routeName,
                        arguments: state.productItemModelList[i],
                      ),
                      child: CustomerProductItem(
                          productItemModel: state.productItemModelList[i]),
                    ),
                  ),
                );
        } else if (state is FetchCategoryProductForCustomerLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FetchCategoryProductForCustomerFailure) {
          return ErrorMessageWidget(errMessage: state.errMessage);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

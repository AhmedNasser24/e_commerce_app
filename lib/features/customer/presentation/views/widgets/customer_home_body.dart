import 'package:e_commerce/core/manager/locale_cubit/locale_cubit.dart';
import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'custome_refresh_indecator_for_customer.dart';
import 'customer_home_view_bloc_provider.dart';
import 'responsive_customer_product_item_list_view.dart';

class CustomerHomeBody extends StatefulWidget {
  const CustomerHomeBody({super.key});

  @override
  State<CustomerHomeBody> createState() => _CustomerHomeBodyState();
}

class _CustomerHomeBodyState extends State<CustomerHomeBody> {
  @override
  void initState() {
    BlocProvider.of<FetchCategoryProductForCustomerCubit>(context)
        .fetchCategoryProductsForCustomer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return BlocConsumer<LocaleCubit, LocaleState>(
          listener: (context, state) {
            if (state is LocaleSuccess) {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CustomerHomeViewBlocProvider())); // to rebuild screen with new language
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: isLoading,
              child: const CustomRefreshIndicatorForCustomer(
                child: ResponsiveCustomerProductItemListView(),
              ),
            );
          },
        );
      },
    );
  }
}


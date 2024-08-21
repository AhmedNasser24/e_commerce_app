import 'package:e_commerce/features/customer/presentation/manager/fetch_category_product_for_customer/fetch_category_product_for_customer_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/list_of_customer_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerHomeBody extends StatefulWidget {
  const CustomerHomeBody({super.key});

  @override
  State<CustomerHomeBody> createState() => _CustomerHomeBodyState();
}

class _CustomerHomeBodyState extends State<CustomerHomeBody> {

  @override
  void initState() {
    BlocProvider.of<FetchCategoryProductForCustomerCubit>(context).fetchCategoryProductsForCustomer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const ListOfCustomerProductCard();
  }
}

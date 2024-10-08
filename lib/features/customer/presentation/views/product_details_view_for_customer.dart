import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/product_details_view_body_for_customer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/models/product_item_model.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../generated/l10n.dart';
import '../../../trader/presentation/views/widgets/back_arrow_button.dart';

class ProductDetailsViewForCustomer extends StatelessWidget {
  const ProductDetailsViewForCustomer({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false ;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartLoading){
          isLoading = true ;
        }
        else{
          isLoading = false ;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          body: SafeArea(
            child: ProductDetailsViewBodyForCustomer(productItemModel: productItemModel),
          ),
          appBar: AppBar(
            title:  Text(productItemModel.name!, style: AppStyle.medium22),
            centerTitle: true,
            leading:  BackArrowButton(
              dismissAction: isLoading ,
            ),
            backgroundColor: kWhiteColor,
          ),
          bottomNavigationBar: CustomBottomAppbar(productItemModel: productItemModel, isLoading: isLoading),
        );
      },
    );
  }
}

class CustomBottomAppbar extends StatelessWidget {
  const CustomBottomAppbar({
    super.key,
    required this.productItemModel,
    required this.isLoading,
  });

  final ProductItemModel productItemModel;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kPurpleColor,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Text("${productItemModel.price!} ${S.of(context).LE}",
              style: AppStyle.semiBold18.copyWith(color: kWhiteColor)),
          const Spacer(),
          CustomButton(
            isLoading: isLoading,
            title: S.of(context).add_to_card,
            style: AppStyle.medium14,
            backGroundColor: kWhiteColor,
            onTap: () {
              BlocProvider.of<CartCubit>(context).addToCart(
                  productItemModel: productItemModel, context: context);
            },
          ),
        ],
      ),
    );
  }
}

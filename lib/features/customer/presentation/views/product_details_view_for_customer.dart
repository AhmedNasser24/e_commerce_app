import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/product_details_view_body_for_customer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../constants.dart';
import '../../../../core/models/product_item_model.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../trader/presentation/views/widgets/back_arrow_button.dart';
import 'widgets/customer_home_view_bloc_provider.dart';

class ProductDetailsViewForCustomer extends StatelessWidget {
  const ProductDetailsViewForCustomer({
    super.key,
    required this.productItemModel,
    this.navigateFromNotification = false,
  });
  final ProductItemModel productItemModel;
  final bool navigateFromNotification;
  static const String routeName = "ProductDetailsViewForCustomer";
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          body: SafeArea(
            child: ProductDetailsViewBodyForCustomer(
                productItemModel: productItemModel),
          ),
          appBar: customAppBar(isLoading, context, navigateFromNotification),
          bottomNavigationBar: CustomBottomAppbar(
              productItemModel: productItemModel, isLoading: isLoading),
        );
      },
    );
  }

  AppBar customAppBar(bool isLoading, context, bool navigateFromNotification) {
    return AppBar(
      title: Text(productItemModel.name!, style: AppStyle.medium22),
      centerTitle: true,
      leading: BackArrowButton(
        dismissAction: isLoading,
        onPressed: () {
          if (FirebaseAuth.instance.currentUser == null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const LoginView()),
                (route) => false);
          } else {
            if (navigateFromNotification == false) {
              Navigator.pop(context);
            } else {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const CustomerHomeViewBlocProvider()),
                  (route) => false);
            }
          }
        },
      ),
      backgroundColor: kWhiteColor,
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
          Text("${productItemModel.price!} ${LocaleKeys.LE.tr()}",
              style: AppStyle.semiBold18.copyWith(color: kWhiteColor)),
          const Spacer(),
          CustomAddToCartbuttonForProductDetailsViewForCustomer(
              isLoading: isLoading, productItemModel: productItemModel),
        ],
      ),
    );
  }
}

class CustomAddToCartbuttonForProductDetailsViewForCustomer
    extends StatelessWidget {
  const CustomAddToCartbuttonForProductDetailsViewForCustomer({
    super.key,
    required this.isLoading,
    required this.productItemModel,
  });

  final bool isLoading;
  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: isLoading,
      title: LocaleKeys.add_to_card.tr(),
      style: AppStyle.medium14,
      backGroundColor: kWhiteColor,
      onTap: () {
        if (FirebaseAuth.instance.currentUser == null) {
          showSnackBar(context, LocaleKeys.login_first.tr());
        } else {
          BlocProvider.of<CartCubit>(context)
              .addToCart(productItemModel: productItemModel, context: context);
        }
      },
    );
  }
}

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/edit_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/models/product_item_model.dart';
import '../../../../core/utils/app_style.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'widgets/back_arrow_button.dart';
import 'widgets/product_details_body_for_trader.dart';

class ProductDetailsViewForTrader extends StatelessWidget {
  const ProductDetailsViewForTrader(
      {super.key, required this.productItemModel});
  final ProductItemModel productItemModel;
  static const String routeName = "/productDetailsViewForTrader";
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<FetchCategoryProductsForTraderCubit,
        FetchCategoryProductsForTraderState>(
      listener: (context, state) {
        if (state is FetchCategoryProductsForTraderLoading) {
          isLoading = true;
        } else if (state is FetchCategoryProductsForTraderSuccess) {
          isLoading = false;
          Navigator.pop(context);
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kWhiteColor,
          body: SafeArea(
            child: ProductDetailsViewBodyForTrader(
                productItemModel: productItemModel),
          ),
          appBar: AppBar(
            title: Text(productItemModel.name!, style: AppStyle.medium22),
            centerTitle: true,
            leading: BackArrowButton(
              dismissAction: isLoading,
            ),
            elevation: 0,
            actions: [
              EditIconButton(productItemModel: productItemModel),
            ],
            backgroundColor: kWhiteColor,
          ),
          bottomNavigationBar: CustomBottomAppbar(
              productItemModel: productItemModel, isLoading: isLoading),
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
          Expanded(
            flex: 2,
            child: Text(
              "${productItemModel.price!} ${AppLocalizations.of(context)!.le}",
              style: AppStyle.semiBold18.copyWith(color: kWhiteColor),
              overflow: TextOverflow.ellipsis,          
            ),
          ),
          Expanded(
            flex: 1,
            child: CustomButton(
              isLoading: isLoading,
              title: AppLocalizations.of(context)!.delete,
              style: AppStyle.medium14,
              backGroundColor: kWhiteColor,
              onTap: () {
                __showConfirmAwesomeDialog(context);
              },
            ),
          ),
        ],
      ),
    );
  }

  void __showConfirmAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: AppLocalizations.of(context)!.are_you_sure_you_want_to_delete_this_product,
      btnOkText: AppLocalizations.of(context)!.yes,
      btnCancelText: AppLocalizations.of(context)!.cancel,
      btnOkOnPress: () {
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .deleteProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {},
    ).show();
  }
}

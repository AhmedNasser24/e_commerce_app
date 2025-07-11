import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:e_commerce/l10n/app_localizations.dart';

import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../core/models/product_item_model.dart';
import '../manager/edit_product_cubit/edit_product_cubit.dart';
import '../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'widgets/back_arrow_button.dart';
import 'widgets/edit_product_body.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key, required this.productItemModel});

  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<EditProductCubit, EditProductState>(
      listener: (context, state) {
        if (state is EditProductFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        } else if (state is EditProductSuccess) {
          isLoading = false;
          __showSuccessAwesomeDialog(context);
        } else if (state is EditProductLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kOffWhiteColor,
          body: SafeArea(
            child: EditProductBody(
              productItemModel: productItemModel,
              isLoading: isLoading,
            ),
          ),
          appBar: editProductAppBar(context, isLoading),
        );
      },
    );
  }

  AppBar editProductAppBar(BuildContext context, bool isLoading) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kPurpleColor,
      leading: BackArrowButton(
        color: kWhiteColor,
        dismissAction: isLoading ? true : false,
      ),
      title: Text(AppLocalizations.of(context)!.edit_product,
          style: AppStyle.medium22.copyWith(color: kWhiteColor)),
      centerTitle: true,
    );
  }

  void __showSuccessAwesomeDialog(context) {
    AwesomeDialog(
      width: kMaxWidthForDialog,
      context: context,
      dismissOnTouchOutside: false,
      dismissOnBackKeyPress: false,
      dialogType: DialogType.success,
      animType: AnimType.topSlide,
      desc: AppLocalizations.of(context)!.product_is_edited_successfully,
      btnOkText: AppLocalizations.of(context)!.ok,
      btnOkOnPress: () {
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .fetchCategoryProductsForTrader();
        Navigator.pop(context);
      },
    ).show();
  }
}

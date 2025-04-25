import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/trader/presentation/manager/edit_product_cubit/edit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

import '../../../../../core/models/product_item_model.dart';

class EditProductButton extends StatelessWidget {
  const EditProductButton({
    super.key,
    required this.formKey,
    required this.productItemModel,
  });
  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: AppLocalizations.of(context)!.edit_product,
      horizontalMargin: 50,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          __showConfirmAwesomeDialog(context);
        } else if (productItemModel.imageFile == null) {
          showSnackBar(context, AppLocalizations.of(context)!.image_is_not_added);
        } else {
          formKey.currentState!.save();
        }
      },
    );
  }

  void __showConfirmAwesomeDialog(context) {
    AwesomeDialog(
      width: kMaxWidthForDialog,
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: AppLocalizations.of(context)!.are_you_sure_you_want_to_edit_this_product,
      btnOkText: AppLocalizations.of(context)!.yes,
      btnCancelText: AppLocalizations.of(context)!.cancel,
      btnOkOnPress: () {
        BlocProvider.of<EditProductCubit>(context)
            .editProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {},
    ).show();
  }
}

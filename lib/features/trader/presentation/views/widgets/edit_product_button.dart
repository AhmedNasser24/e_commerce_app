import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/trader/presentation/manager/edit_product_cubit/edit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/models/product_item_model.dart';

class EditProductButton extends StatelessWidget {
  const EditProductButton(
      {super.key,
      required this.formKey,
      required this.productItemModel,
      });
  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: LocaleKeys.edit_product.tr(),
      horizontalMargin: 50,
      onTap: () async {
        if (formKey.currentState!.validate()) {
          __showConfirmAwesomeDialog(context);
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
      desc: LocaleKeys.are_you_sure_you_want_to_edit_this_product.tr(),
      btnOkText: LocaleKeys.yes.tr(),
      btnCancelText: LocaleKeys.cancel.tr(),
      btnOkOnPress: () {
        BlocProvider.of<EditProductCubit>(context)
              .editProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {} ,
    ).show();
  }
}

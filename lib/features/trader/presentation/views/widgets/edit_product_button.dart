import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/trader/presentation/manager/edit_product_cubit/edit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';

class EditProductButton extends StatelessWidget {
  const EditProductButton(
      {super.key,
      required this.formKey,
      required this.productItemModel,
      required this.isLoading});
  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      isLoading: isLoading,
      title: S.of(context).edit_product,
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
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: S.of(context).are_you_sure_you_want_to_edit_this_product,
      btnOkText: S.of(context).yes,
      btnCancelText: S.of(context).cancel,
      btnOkOnPress: () {
        BlocProvider.of<EditProductCubit>(context)
              .editProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {} ,
    ).show();
  }
}

import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
    required this.formKey,
    required this.productItemModel,
  });

  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: LocaleKeys.add_product.tr(),
      horizontalMargin: 50,
      onTap: () {
        if (formKey.currentState!.validate()) {
          __showConfirmAwesomeDialog(context) ;
        } else {
          formKey.currentState!.save();
        }
      },
    );
  }

  void setProductIdAndTraderIdAndDate() {
    productItemModel.createAt = DateTime.now().toString();
    productItemModel.productId = Random().nextDouble().toString();
    productItemModel.traderId = FirebaseAuth.instance.currentUser!.uid;
  }
  void __showConfirmAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: LocaleKeys.are_you_sure_you_want_to_add_this_product.tr(),
      btnOkText: LocaleKeys.yes.tr(),
      btnCancelText: LocaleKeys.cancel.tr(),
      btnOkOnPress: () {
        setProductIdAndTraderIdAndDate();
          BlocProvider.of<AddProductCubit>(context)
              .addProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {} ,
    ).show();
  }
}

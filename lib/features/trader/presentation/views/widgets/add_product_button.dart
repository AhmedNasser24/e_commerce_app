import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../l10n/app_localizations.dart';
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
      title: AppLocalizations.of(context)!.add_product,
      horizontalMargin: 50,
      onTap: () {
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

  void setProductIdAndTraderIdAndDate() {
    productItemModel.createAt = DateTime.now().toString();
    productItemModel.productId = Random().nextDouble().toString();
    productItemModel.traderId = FirebaseAuth.instance.currentUser!.uid;
  }

  void __showConfirmAwesomeDialog(context) {
    AwesomeDialog(
      width: kMaxWidthForDialog,
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: AppLocalizations.of(context)!.are_you_sure_you_want_to_add_this_product,
      btnOkText: AppLocalizations.of(context)!.yes,
      btnCancelText: AppLocalizations.of(context)!.cancel,
      btnOkOnPress: () {
        setProductIdAndTraderIdAndDate();
        BlocProvider.of<AddProductCubit>(context)
            .addProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {},
    ).show();
  }
}

import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';

class EditProductButton extends StatelessWidget {
  const EditProductButton({super.key, required this.formKey, required this.productItemModel});
  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).edit_product,
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.pop(context) ;
        } else {
          formKey.currentState!.save();
        }
      },
    );
  }
}

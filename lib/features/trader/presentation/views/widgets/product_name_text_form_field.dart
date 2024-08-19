import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ProductNameTextFormField extends StatelessWidget {
  const ProductNameTextFormField({
    super.key,
    this.productName = '', required this.productItemModel,
  });
  final ProductItemModel productItemModel ;
  final String productName ;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: productName),
      hintText: S.of(context).product_name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        productItemModel.name = value ;
        return null;
      },
    );
  }
}



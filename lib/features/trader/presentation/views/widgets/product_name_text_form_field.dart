import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class ProductNameTextFormField extends StatelessWidget {
  const ProductNameTextFormField({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel ;
  
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: productItemModel.name ?? ''),
      hintText: LocaleKeys.product_name.tr(),
      
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.required_field.tr();
        }
        productItemModel.name = value ;
        return null;
      },
    );
  }
}



import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';

class ProductDescTextFormField extends StatelessWidget {
  const ProductDescTextFormField({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel ;
  
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: productItemModel.desc ?? ''),
      hintText: LocaleKeys.product_desc.tr(),
      maxLines: 5,
      validator: (value) {
        
        productItemModel.desc = value ;
        return null;
      },
    );
  }
}



import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/l10n/app_localizations.dart';

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
      hintText: AppLocalizations.of(context)!.product_desc,
      maxLines: 5,
      validator: (value) {
        
        productItemModel.desc = value ;
        return null;
      },
    );
  }
}



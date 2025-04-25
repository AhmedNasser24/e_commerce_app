import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';

import 'package:e_commerce/l10n/app_localizations.dart';

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
      hintText: AppLocalizations.of(context)!.product_name,
      
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required_field;
        }
        productItemModel.name = value ;
        return null;
      },
    );
  }
}



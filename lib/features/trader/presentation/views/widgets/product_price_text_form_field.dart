import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/models/product_item_model.dart';

class ProductPriceTextFormField extends StatelessWidget {
  const ProductPriceTextFormField({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: productItemModel.price ?? ''),
      hintText: AppLocalizations.of(context)!.product_price,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required_field;
        }
        productItemModel.price = value;
        return null;
      },
    );
  }
}

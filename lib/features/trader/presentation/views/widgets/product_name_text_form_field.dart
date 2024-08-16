import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class ProductNameTextFormField extends StatelessWidget {
  const ProductNameTextFormField({
    super.key,
    this.productName = '',
  });
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
        return null;
      },
    );
  }
}



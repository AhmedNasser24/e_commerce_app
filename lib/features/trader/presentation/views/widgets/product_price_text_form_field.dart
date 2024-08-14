import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class ProductPriceTextFormField extends StatelessWidget {
  const ProductPriceTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Product Price",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        return null;
      },
    );
  }
}
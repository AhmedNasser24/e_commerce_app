import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class ProductNameTextFormField extends StatelessWidget {
  const ProductNameTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: "Product Name",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        return null;
      },
    );
  }
}



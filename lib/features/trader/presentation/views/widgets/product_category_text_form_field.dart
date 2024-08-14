import 'package:flutter/material.dart';

import '../../../../../core/functions/product_category.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class ProductCategoryTextFormField extends StatefulWidget {
  const ProductCategoryTextFormField({
    super.key,
  });

  @override
  State<ProductCategoryTextFormField> createState() =>
      _ProductCategoryTextFormFieldState();
}

class _ProductCategoryTextFormFieldState
    extends State<ProductCategoryTextFormField> {
  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: selectedCategory),
      hintText: "Product Category",
      readOnly: true,
      onTap: () {
        _showCategoryDialog(context);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        return null;
      },
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).account_kind),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: categoryList(context)
                .map(
                  (category) => ListTile(
                    title: Text(category),
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                      });
                      Navigator.pop(context);
                    },
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}

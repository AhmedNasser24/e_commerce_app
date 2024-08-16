import 'package:flutter/material.dart';

import '../../../../../core/functions/list_of_product_category.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class ProductCategoryTextFormField extends StatefulWidget {
  const ProductCategoryTextFormField({
    super.key,
    this.selectedCategory = '',
  });
  final String selectedCategory;
  @override
  State<ProductCategoryTextFormField> createState() =>
      _ProductCategoryTextFormFieldState();
}

class _ProductCategoryTextFormFieldState
    extends State<ProductCategoryTextFormField> {
  late String selectedCategory  ;
  late TextEditingController controller ;
  @override
  void initState() {
    selectedCategory = widget.selectedCategory ;
    controller = TextEditingController(text: selectedCategory);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: S.of(context).product_category,
      readOnly: true,
      suffixIcon : const Icon(Icons.arrow_drop_down, color : Colors.black),
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
          title: Text(S.of(context).product_category),
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

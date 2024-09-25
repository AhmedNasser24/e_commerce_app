import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../core/functions/list_of_product_category.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';

class ProductCategoryTextFormField extends StatefulWidget {
  const ProductCategoryTextFormField({
    super.key,
     required this.productItemModel,
  });
  final ProductItemModel productItemModel ;

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
    selectedCategory = widget.productItemModel.category ?? '' ;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: selectedCategory),
      hintText: S.of(context).product_category,
      readOnly: true,
      suffixIcon : const Icon(Icons.arrow_drop_down, color : kPurpleColor),
      onTap: () {
        _showCategoryDialog(context);
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        widget.productItemModel.category = value;
        return null;
      },
    );
  }

  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(S.of(context).product_category , style: AppStyle.bold18)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: categoryList(context)
                  .map(
                    (category) => ListTile(
                      title: Text(category , style: AppStyle.medium14),
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
          ),
        );
      },
    );
  }
}

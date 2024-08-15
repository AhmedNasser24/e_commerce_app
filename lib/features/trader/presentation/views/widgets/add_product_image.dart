import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';


class AddProductImageTextFormField extends StatefulWidget {
  const AddProductImageTextFormField({
    super.key,
  });

  @override
  State<AddProductImageTextFormField> createState() =>
      _AddProductImageTextFormFieldState();
}

class _AddProductImageTextFormFieldState
    extends State<AddProductImageTextFormField> {
  String selectedImage = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: selectedImage),
      hintText: S.of(context).product_image,
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
    List < String > pickImageFrom = [S.of(context).from_camera , S.of(context).from_gallery] ;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).product_image),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: pickImageFrom
                .map(
                  (category) => ListTile(
                    title: Text(category),
                    onTap: () {
                      setState(() {
                        selectedImage = S.of(context).image_is_added;
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

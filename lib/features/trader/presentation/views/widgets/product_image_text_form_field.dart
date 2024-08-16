// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/core/functions/img_picker.dart';
import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';

class ProductImageTextFormField extends StatefulWidget {
  const ProductImageTextFormField({
    super.key,
    this.imageUrl = '',
  });

  final String imageUrl ;
  @override
  State<ProductImageTextFormField> createState() =>
      _ProductImageTextFormFieldState();
}

class _ProductImageTextFormFieldState
    extends State<ProductImageTextFormField> {
  String selectedImage = '' ;
 
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: TextEditingController(text: selectedImage),
      hintText: S.of(context).product_image,
      readOnly: true,
      suffixIcon: const Icon(Icons.arrow_drop_down, color: Colors.black),
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
    List<String> pickImageFrom = [
      S.of(context).from_camera,
      S.of(context).from_gallery
    ];
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
                    onTap: () async {
                      Navigator.pop(context);
                      String? imageUrl;
                      if (category == S.of(context).from_camera) {
                        imageUrl = await imgPickerFromCamera();
                      } else {
                        imageUrl = await imgPickerFromGallery();
                      }
                      if (imageUrl != null) {
                        setState(() {
                          selectedImage = S.of(context).image_is_added;
                        });
                      }else {
                        showSnackBar(context, S.of(context).image_is_not_added);
                      }

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

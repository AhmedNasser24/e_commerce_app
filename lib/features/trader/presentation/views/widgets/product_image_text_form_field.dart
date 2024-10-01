// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';

class ProductImageTextFormField extends StatefulWidget {
  const ProductImageTextFormField({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;

  @override
  State<ProductImageTextFormField> createState() =>
      _ProductImageTextFormFieldState();
}

class _ProductImageTextFormFieldState extends State<ProductImageTextFormField> {
  late String selectedImage;
  @override
  void initState() {
    selectedImage = widget.productItemModel.imageUrl ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ImagePickerCubit, ImagePickerState>(
      listener: (context, state) {
        if (state is ImagePickerSuccess) {
          selectedImage = state.imageUrl;
          widget.productItemModel.imageUrl = selectedImage;
        }
      },
      builder: (context, state) {
        return CustomTextFormField(
          controller: TextEditingController(text: selectedImage),
          hintText: S.of(context).product_image,
          readOnly: true,
          suffixIcon: const Icon(Icons.arrow_drop_down, color: kPurpleColor),
          onTap: () async {
            await _showCategoryDialog(context);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).required_field;
            }
            return null;
          },
        );
      },
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async {
    List<String> pickImageFrom = [
      S.of(context).from_camera,
      S.of(context).from_gallery
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
              alignment: Alignment.topCenter,
              child: Text(S.of(context).product_image, style: AppStyle.bold18)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: pickImageFrom
                .map(
                  (category) => ListTile(
                    title: Text(category, style: AppStyle.medium14),
                    onTap: () {
                      if (category == S.of(context).from_camera) {
                        BlocProvider.of<ImagePickerCubit>(context)
                            .imagePickerFromCamera();
                      } else {
                        BlocProvider.of<ImagePickerCubit>(context)
                            .imagePickerFromGallery();
                      }
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

// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
          hintText: LocaleKeys.product_image.tr(),
          readOnly: true,
          suffixIcon: const Icon(Icons.arrow_drop_down, color: kPurpleColor),
          onTap: () async {
            await _showCategoryDialog(context);
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.required_field.tr();
            }
            return null;
          },
        );
      },
    );
  }

  Future<void> _showCategoryDialog(BuildContext context) async {
    List<String> pickImageFrom = [
      LocaleKeys.from_camera.tr(),
      LocaleKeys.from_gallery.tr()
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
              alignment: Alignment.topCenter,
              child: Text(LocaleKeys.product_image.tr(), style: AppStyle.bold18)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: pickImageFrom
                .map(
                  (category) => ListTile(
                    title: Text(category, style: AppStyle.medium14),
                    onTap: () {
                      if (category == LocaleKeys.from_camera.tr()) {
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

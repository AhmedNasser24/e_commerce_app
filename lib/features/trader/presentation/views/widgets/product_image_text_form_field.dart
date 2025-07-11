// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:e_commerce/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/services/image_picker_services.dart';
import '../../../../../core/utils/app_color.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/models/product_item_model.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

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
  bool isLoading = false;
  ProductItemModel get productItemModel => widget.productItemModel; 
  late ProductItemModel productItemModelCopy ;
  @override
  void initState() {
    super.initState();
    productItemModelCopy = ProductItemModel(
      imageUrl: productItemModel.imageUrl,
      imageFile: productItemModel.imageFile,
      name: productItemModel.name,
      category: productItemModel.category,
      price: productItemModel.price,
      desc: productItemModel.desc,
      productId: productItemModel.productId,
      quantity: productItemModel.quantity,
      traderId: productItemModel.traderId,
      createAt: productItemModel.createAt,

      
    );
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: productItemModelCopy.imageUrl != null
            ? Container(
                constraints: const BoxConstraints(maxWidth: 340),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomCachedNetworkImage(
                        imageUrl: productItemModelCopy.imageUrl!),
                    const Gap(5),
                    IconButton(
                      onPressed: () {
                        productItemModelCopy.imageUrl = null;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: AppColor.primaryColor,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              )
            : AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: productItemModelCopy.imageFile == null
                    ? AbsorbPointer(
                        absorbing: isLoading,
                        child: GestureDetector(
                          onTap: () async {
                            
                            productItemModelCopy.imageFile =
                                await _showCategoryDialog(context);
                            productItemModel.imageFile = productItemModelCopy.imageFile;    
                            log('imageFile: ${productItemModelCopy.imageFile?.path}');    
                            setState(() {});
                          },
                          child: DottedBorder(
                            color: AppColor.primaryColor,
                            borderType: BorderType.RRect,
                            radius: const Radius.circular(12),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SvgPicture.asset(Assets.imagesImageIcon),
                                // const Gap(8),
                                Text(AppLocalizations.of(context)!.add_image, style: AppStyle.medium18),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Image.file(
                                    productItemModelCopy.imageFile!,
                                    fit: BoxFit.fill),
                              ),
                            ),
                            const Gap(8),
                            IconButton(
                              onPressed: () {
                                productItemModelCopy.imageFile = null;
                                productItemModel.imageFile = productItemModelCopy.imageFile;    
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: AppColor.primaryColor,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
              ),
      ),
    );
  }

Future<File?> _showCategoryDialog(BuildContext context) async {
  List<String> pickImageFrom = [
    AppLocalizations.of(context)!.from_camera,
    AppLocalizations.of(context)!.from_gallery
  ];

  return await showDialog<File>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Align(
          alignment: Alignment.topCenter,
          child: Text(AppLocalizations.of(context)!.product_image, style: AppStyle.bold18),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: pickImageFrom
              .map(
                (category) => ListTile(
                  title: Text(category, style: AppStyle.medium14),
                  onTap: () async {
                    File? imageFile;
                    if (category == AppLocalizations.of(context)!.from_camera) {
                      imageFile = await ImagePickerService.pickImageFromCamera();
                    } else {
                      imageFile = await ImagePickerService.pickImageFromGallery();
                    }
                    log('dialog imageFile: ${imageFile?.path}');
                    Navigator.pop(context, imageFile); // Pass the imageFile back
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

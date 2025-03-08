import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/product_image_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'edit_product_button.dart';
import 'product_category_text_form_field.dart';
import 'product_desc_text_form_field.dart';
import 'product_name_text_form_field.dart';
import 'product_price_text_form_field.dart';

class EditProductBody extends StatefulWidget {
  const EditProductBody(
      {super.key, required this.productItemModel, required this.isLoading});
  final ProductItemModel productItemModel;
  final bool isLoading;
  @override
  State<EditProductBody> createState() => _EditProductBodyState();
}

class _EditProductBodyState extends State<EditProductBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: AbsorbPointer(
        absorbing: widget.isLoading,
        child: ModalProgressHUD(
          inAsyncCall: widget.isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(40),
                  Text("${LocaleKeys.product_name.tr()} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductNameTextFormField(
                      productItemModel: widget.productItemModel),
                  const Gap(25),
                  Text("${LocaleKeys.product_category.tr()} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductCategoryTextFormField(
                      productItemModel: widget.productItemModel),
                  const Gap(25),
                  Text("${LocaleKeys.product_price.tr()} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductPriceTextFormField(
                      productItemModel: widget.productItemModel),
                  const Gap(25),
                  Text("${LocaleKeys.product_image.tr()} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductImageTextFormField(
                      productItemModel: widget.productItemModel),
                  const Gap(25),
                  Text(LocaleKeys.product_desc.tr(), style: AppStyle.medium14),
                  const Gap(5),
                  ProductDescTextFormField(
                      productItemModel: widget.productItemModel),
                  const Gap(40),
                  Align(
                    alignment: Alignment.center,
                    child: EditProductButton(
                        formKey: formKey,
                        productItemModel: widget.productItemModel),
                  ),
                  const Gap(60),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

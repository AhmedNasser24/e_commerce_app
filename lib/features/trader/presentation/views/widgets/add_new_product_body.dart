import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/product_image_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../../core/utils/app_style.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'add_product_button.dart';
import 'product_category_text_form_field.dart';
import 'product_desc_text_form_field.dart';
import 'product_name_text_form_field.dart';
import 'product_price_text_form_field.dart';

class AddNewProductBody extends StatefulWidget {
  const AddNewProductBody({super.key, required this.isLoading});
  final bool isLoading;

  @override
  State<AddNewProductBody> createState() => _AddNewProductBodyState();
}

class _AddNewProductBodyState extends State<AddNewProductBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProductItemModel productItemModel = ProductItemModel();
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.isLoading,
      child: ModalProgressHUD(
        inAsyncCall: widget.isLoading,
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(40),
                  Text("${AppLocalizations.of(context)!.product_name} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductNameTextFormField(productItemModel: productItemModel),
                  const Gap(25),
                  Text("${AppLocalizations.of(context)!.product_category} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductCategoryTextFormField(
                      productItemModel: productItemModel),
                  const Gap(25),
                  Text("${AppLocalizations.of(context)!.product_price} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductPriceTextFormField(productItemModel: productItemModel),
                  const Gap(25),
                  Text(AppLocalizations.of(context)!.product_desc, style: AppStyle.medium14),
                  const Gap(5),
                  ProductDescTextFormField(productItemModel: productItemModel),
                  const Gap(25),
                  Text("${AppLocalizations.of(context)!.product_image} *",
                      style: AppStyle.medium14),
                  const Gap(5),
                  ProductImageTextFormField(productItemModel: productItemModel),
                  const Gap(40),
                  Align(
                    alignment: Alignment.center,
                    child: AddProductButton(
                      formKey: formKey,
                      productItemModel: productItemModel,
                    ),
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

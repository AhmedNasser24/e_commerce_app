import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/product_image_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import 'edit_product_button_bloc_consumer.dart';
import 'product_category_text_form_field.dart';
import 'product_name_text_form_field.dart';
import 'product_price_text_form_field.dart';

class EditProductBody extends StatefulWidget {
  const EditProductBody({super.key, required this.productItemModel});
  final ProductItemModel productItemModel  ;

  @override
  State<EditProductBody> createState() => _EditProductBodyState();
}

class _EditProductBodyState extends State<EditProductBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40),
              Text("${S.of(context).product_name} *", style: AppStyle.medium14),
              const Gap(5),
               ProductNameTextFormField( productItemModel: widget.productItemModel),
              const Gap(25),
              Text("${S.of(context).product_category} *",
                  style: AppStyle.medium14),
              const Gap(5),
               ProductCategoryTextFormField(productItemModel: widget.productItemModel),
              const Gap(25),
              Text("${S.of(context).product_price} *",
                  style: AppStyle.medium14),
              const Gap(5),
               ProductPriceTextFormField(productItemModel: widget.productItemModel),
              const Gap(25),
              Text("${S.of(context).product_image} *",
                  style: AppStyle.medium14),
              const Gap(5),
               ProductImageTextFormField(productItemModel: widget.productItemModel),
              const Gap(40),
              Align(
                alignment: Alignment.center,
                child: EditProductButtonBlocConsumer(formKey: formKey,productItemModel: widget.productItemModel),
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}

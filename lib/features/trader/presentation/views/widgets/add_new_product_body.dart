import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/product_image_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import 'add_product_button_bloc_consumer.dart';
import 'product_category_text_form_field.dart';
import 'product_name_text_form_field.dart';
import 'product_price_text_form_field.dart';

class AddNewProductBody extends StatefulWidget {
  const AddNewProductBody({super.key});

  @override
  State<AddNewProductBody> createState() => _AddNewProductBodyState();
}

class _AddNewProductBodyState extends State<AddNewProductBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ProductItemModel productItemModel = ProductItemModel() ;
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
               ProductNameTextFormField(productItemModel:productItemModel),
              const Gap(25),
              Text("${S.of(context).product_category} *",
                  style: AppStyle.medium14),
              const Gap(5),
               ProductCategoryTextFormField(productItemModel:productItemModel),
              const Gap(25),
              Text("${S.of(context).product_price} *",
                  style: AppStyle.medium14),
              const Gap(5),
               ProductPriceTextFormField(productItemModel:productItemModel),
              const Gap(25),
              Text("${S.of(context).product_image} *",
                  style: AppStyle.medium14),
              const Gap(5),
               ProductImageTextFormField(productItemModel:productItemModel),
              const Gap(40),
              Align(
                alignment: Alignment.center,
                child: AddProductButtonBlocConsumer(formKey: formKey , productItemModel:productItemModel),
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}

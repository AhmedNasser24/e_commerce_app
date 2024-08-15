import 'package:e_commerce/features/trader/presentation/views/widgets/add_product_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import 'add_product_button.dart';
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
              const ProductNameTextFormField(),
              const Gap(25),
              Text("${S.of(context).product_category} *",
                  style: AppStyle.medium14),
              const Gap(5),
              const ProductCategoryTextFormField(),
              const Gap(25),
              Text("${S.of(context).product_price} *",
                  style: AppStyle.medium14),
              const Gap(5),
              const ProductPriceTextFormField(),
              const Gap(25),
              Text("${S.of(context).product_image} *",
                  style: AppStyle.medium14),
              const Gap(5),
              const AddProductImageTextFormField(),
              const Gap(40),
              Align(
                alignment: Alignment.center,
                child: AddProductButton(formKey: formKey),
              ),
              const Gap(60),
            ],
          ),
        ),
      ),
    );
  }
}

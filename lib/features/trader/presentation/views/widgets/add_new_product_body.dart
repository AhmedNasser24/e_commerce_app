import 'package:e_commerce/utils/core/app_style.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(40),
              Text('Product Name', style: AppStyle.medium14),
              Gap(5),
              ProductNameTextFormField(),
              Gap(25),
              Text('Product Category', style: AppStyle.medium14),
              Gap(5),
              ProductCategoryTextFormField(),
              Gap(25),
              Text('Product Price', style: AppStyle.medium14),
              Gap(5),
              ProductPriceTextFormField(),
              Gap(40),
          
            ],
          ),
        ),
      ),
    );
  }
}

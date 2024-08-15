import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).add_product,
      onTap: () {
        if (formKey.currentState!.validate()) {
          Navigator.pop(context) ;
        } else {
          formKey.currentState!.save();
        }
      },
    );
  }
}

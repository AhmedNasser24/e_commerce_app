import 'package:e_commerce/core/utils/app_style.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class AddToCardButton extends StatelessWidget {
  const AddToCardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title :S.of(context).add_to_card,
      style: AppStyle.medium12,
    );
  }
}

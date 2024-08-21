import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).buy,
      style: AppStyle.semiBold20,
      onTap: () {},
    );
  }
}

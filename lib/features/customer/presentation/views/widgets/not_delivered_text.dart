import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';

class NotDeliveredText extends StatelessWidget {
  const NotDeliveredText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).not_delivered,
      style: AppStyle.medium14,
      backGroundColor: kWhiteColor,
      horizontalPadding: 6,
      verticalPadding: 0,
      onTap: () {},
    );
  }
}

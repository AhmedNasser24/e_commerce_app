import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/locale_keys.g.dart';

class NotDeliveredText extends StatelessWidget {
  const NotDeliveredText({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: LocaleKeys.not_delivered.tr(),
      style: AppStyle.medium14,
      backGroundColor: kWhiteColor,
      horizontalPadding: 6,
      verticalPadding: 0,
      onTap: () {},
    );
  }
}

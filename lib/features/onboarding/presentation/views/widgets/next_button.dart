import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class NextButton extends StatelessWidget {
  const NextButton(this.pageController, {super.key, });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: LocaleKeys.onboarding_next.tr(),
      onTap: () {
        pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
    );
  }
}
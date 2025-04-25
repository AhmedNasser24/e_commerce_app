import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class NextButton extends StatelessWidget {
  const NextButton(this.pageController, {super.key, });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: AppLocalizations.of(context)!.onboarding_next,
      onTap: () {
        pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
      },
    );
  }
}
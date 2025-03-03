import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';

class NextButton extends StatelessWidget {
  const NextButton(this.pageController, {super.key, });
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Next',
      onTap: () {
        pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      },
    );
  }
}
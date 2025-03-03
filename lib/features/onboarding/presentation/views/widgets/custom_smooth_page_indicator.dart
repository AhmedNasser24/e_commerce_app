import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../constants.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.pageController,
  }) ;

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: 2,
      axisDirection: Axis.horizontal,
      effect: const SlideEffect(
        spacing: 8.0,
        radius: 5,
        dotHeight: 10,
        dotWidth: 10,
        paintStyle: PaintingStyle.fill,
        dotColor:  Colors.grey,
        activeDotColor: kPurpleColor,
      ),
    );
  }
}
import 'package:e_commerce/features/onboarding/presentation/views/widgets/custom_smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'page_view_1.dart';
import 'page_view_2.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {

  late PageController pageController ;
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              children: const [
                PageView1(),
                PageView2(),
              ],
            ),
          ),
          CustomSmoothPageIndicator(
            pageController: pageController,
            currentPage: pageController.page!.round(),
          ),
          const Gap(40),
        ],
      ),
    );
  }
}


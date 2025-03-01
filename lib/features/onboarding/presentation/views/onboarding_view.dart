import 'package:flutter/material.dart';

import 'widgets/onboarding_view_body.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFEFF),
      body: SafeArea(
        child: Center(
          child: OnboardingViewBody(),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'page_view_1.dart';
import 'page_view_2.dart';

class OnboardingViewBody extends StatelessWidget {
  const OnboardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: PageView(
        children: const [
          PageView1(),
          PageView2(),
        ],
      ),
    );
  }
}


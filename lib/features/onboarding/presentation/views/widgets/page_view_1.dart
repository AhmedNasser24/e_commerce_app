import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class PageView1 extends StatelessWidget {
  const PageView1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        SizedBox(
          height: 250,
          width: 250,
          child: Image.asset(Assets.imagesOnboarding1 , fit: BoxFit.fill),
        ),
        const Gap(50),
         const Text(
          "Welcome to the E-Commerce" ,
          style: AppStyle.bold20,
          textAlign: TextAlign.center,
        ),
        const Gap(20),
         const Text(
          "In this app , Traders can upload their products with there prefered details and prices to sell them",
          style: AppStyle.regular14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

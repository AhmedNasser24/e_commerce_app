import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';

class PageView2 extends StatelessWidget {
  const PageView2({
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
          child: Image.asset(Assets.imagesOnboarding2 , fit: BoxFit.fill),
        ),
        const Gap(50),
         const Text(
         "Welcome to the E-Commerce" ,
          style: AppStyle.bold20,
          textAlign: TextAlign.center,
        ),
        const Gap(20),
         const Text(
         "Customers can buy products from different categories , add them to their cart , view their orders and confirm them after receiving them",
          style: AppStyle.regular14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

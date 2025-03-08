import 'package:e_commerce/generated/local_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
          child: Image.asset(Assets.imagesOnboarding2, fit: BoxFit.fill),
        ),
        const Gap(50),
        Text(
          LocaleKeys.onboarding_title.tr(),
          style: AppStyle.bold20,
          textAlign: TextAlign.center,
        ),
        const Gap(20),
        Text(
          LocaleKeys.onboarding_subtitle2.tr(),
          style: AppStyle.regular14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

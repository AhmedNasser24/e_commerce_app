import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import 'on_boarding_image.dart';

class PageView1 extends StatelessWidget {
  const PageView1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        OnBoardingImage(Assets.imagesOnboarding1),
        const Gap(50),
        Container(
          constraints: BoxConstraints(maxWidth: 340),
          child: Text(
            AppLocalizations.of(context)!.onboarding_title,
            style: AppStyle.bold20,
            textAlign: TextAlign.center,
          ),
        ),
        const Gap(20),
        Container(
          constraints: BoxConstraints(maxWidth: 340),
          child: Text(
            AppLocalizations.of(context)!.onboarding_subtitle1,
            style: AppStyle.regular14,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

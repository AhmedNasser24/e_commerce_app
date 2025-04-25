import 'package:e_commerce/features/onboarding/presentation/views/widgets/on_boarding_image.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
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
        OnBoardingImage(Assets.imagesOnboarding2),
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
            AppLocalizations.of(context)!.onboarding_subtitle2,
            style: AppStyle.regular14,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';

class PageView2 extends StatelessWidget {
  const PageView2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          child: Image.asset(Assets.imagesOnboarding2),
        ),
        const Gap(50),
         Text(
          S.of(context).we_will_contact_you_within_24_hours ,
          style: AppStyle.bold20,
          textAlign: TextAlign.center,
        ),
        const Gap(20),
         Text(
          S.of(context).shoes_category,
          style: AppStyle.regular14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

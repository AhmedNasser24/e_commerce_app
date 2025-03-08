import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/shared_preference_singleton.dart';
import 'package:e_commerce/features/auth/presentation/views/register_view.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: LocaleKeys.onboarding_start.tr(),
      onTap: () {
        SharedPreferenceSingleton.setbool(kIsONBoardingVisited, true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView()));
      },
    );
  }
}
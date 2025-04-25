import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/shared_preference_singleton.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: AppLocalizations.of(context)!.onboarding_start,
      onTap: () {
        SharedPreferenceSingleton.setbool(kIsONBoardingVisited, true);
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      },
    );
  }
}
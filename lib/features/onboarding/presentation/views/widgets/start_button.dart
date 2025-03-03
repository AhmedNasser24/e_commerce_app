import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/shared_preference_singleton.dart';
import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../auth/presentation/views/login_view.dart';

class StartButton extends StatelessWidget {
  const StartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: 'Start',
      onTap: () {
        SharedPreferenceSingleton.setbool(kIsONBoardingVisited, true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView()));
      },
    );
  }
}
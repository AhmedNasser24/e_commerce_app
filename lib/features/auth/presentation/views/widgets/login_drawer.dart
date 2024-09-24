
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/select_language.dart';

class LoginDrawer extends StatelessWidget {
  const LoginDrawer({
    super.key, required this.changeLanguage,
    
  });

    final void Function(Locale newLocale) changeLanguage;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(50),
        SelectLanguage(changeLanguage: changeLanguage),
      ],
    );
  }
}

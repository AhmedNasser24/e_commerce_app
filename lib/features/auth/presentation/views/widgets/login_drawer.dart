import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/widgets/select_language.dart';

class LoginDrawer extends StatelessWidget {
  const LoginDrawer({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Gap(50),
        SelectLanguage(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../register_view.dart';

class NavigateToRegisterView extends StatelessWidget {
  const NavigateToRegisterView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView())) ;
      },
      child: Text(S.of(context).register, style: AppStyle.medium20.copyWith(color: kWhiteColor)),
    );
  }
}

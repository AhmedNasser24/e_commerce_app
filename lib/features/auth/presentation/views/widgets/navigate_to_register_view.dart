import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
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
      child: Text(LocaleKeys.register.tr(), style: AppStyle.medium16.copyWith(color: kWhiteColor)),
    );
  }
}

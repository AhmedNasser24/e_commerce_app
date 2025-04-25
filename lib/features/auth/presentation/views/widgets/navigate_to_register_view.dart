import 'package:e_commerce/l10n/app_localizations.dart';
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
        Navigator.pushNamed(context, RegisterView.routeName);
      },
      child: Text(AppLocalizations.of(context)!.register, style: AppStyle.medium16.copyWith(color: kWhiteColor)),
    );
  }
}

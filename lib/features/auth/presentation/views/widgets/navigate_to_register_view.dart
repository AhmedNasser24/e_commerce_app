import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/core/app_style.dart';
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
      child: Row(
        children: [
          const Spacer(),
          Text(S.of(context).register, style: AppStyle.medium16),
        ],
      ),
    );
  }
}

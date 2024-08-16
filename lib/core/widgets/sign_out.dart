import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_style.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).sign_out,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.logout),
    );
  }
}
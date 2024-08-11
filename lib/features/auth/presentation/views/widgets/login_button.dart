import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/core/app_style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          print('valid');
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(218, 182, 165, 71)),
        child: Text(S.of(context).login, style: AppStyle.regular16),
      ),
    );
  }
}

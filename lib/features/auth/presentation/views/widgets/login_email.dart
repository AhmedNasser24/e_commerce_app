import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../data/models/login_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({
    super.key,
    required this.loginModel,
  });
  final LoginModel loginModel;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: AppLocalizations.of(context)!.email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required_field;
        }
        
        value = value.trim();
        final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        final emailRegExp = RegExp(emailPattern);
        if (!emailRegExp.hasMatch(value)) {
          return AppLocalizations.of(context)!.invalid_email;
        }

        loginModel.email = value;
        return null;
      },
    );
  }
}

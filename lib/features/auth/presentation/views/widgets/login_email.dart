import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
      hintText: LocaleKeys.email.tr(),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.required_field.tr();
        }
        
        value = value.trim();
        final emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
        final emailRegExp = RegExp(emailPattern);
        if (!emailRegExp.hasMatch(value)) {
          return LocaleKeys.invalid_email.tr();
        }

        loginModel.email = value;
        return null;
      },
    );
  }
}

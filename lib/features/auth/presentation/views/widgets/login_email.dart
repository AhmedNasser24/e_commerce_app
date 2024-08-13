import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/login_model.dart';
import 'custom_text_form_field.dart';

class LoginEmail extends StatelessWidget {
  const LoginEmail({
    super.key,
    required this.loginModel,
  });
  final LoginModel loginModel;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: S.of(context).email,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        loginModel.email = value;
        return null;
      },
    );
  }
}

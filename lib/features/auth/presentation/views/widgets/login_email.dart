
import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text_form_field.dart';

class LoginEmail extends StatefulWidget {
  const LoginEmail({
    super.key,
  });

  @override
  State<LoginEmail> createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {
  String email = '';

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: S.of(context).email,
      
      onChanged: (value) => email = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field ;
        }
        return null;
      },
    );
  }
}
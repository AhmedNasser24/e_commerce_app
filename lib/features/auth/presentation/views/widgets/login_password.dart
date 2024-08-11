import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import 'custom_text_form_field.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({
    super.key,
  });

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  String password = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(hintText: S.of(context).password,
    onChanged: (value) => password = value,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return S.of(context).required_field ;
      }
      return null;
    },
    );
  }
}
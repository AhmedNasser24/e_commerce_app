import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text_form_field.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({
    super.key,
  });

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: 'email' , //  S.of(context).email,
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
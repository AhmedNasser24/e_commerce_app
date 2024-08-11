import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text_form_field.dart';

class RegisterName extends StatefulWidget {
  const RegisterName({
    super.key,
  });

  @override
  State<RegisterName> createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText:  S.of(context).name,
      onChanged: (value) => name = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field ;
        }
        return null;
      },
    );
  }
}
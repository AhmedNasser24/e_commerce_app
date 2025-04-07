import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/register_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class RegisterEmail extends StatefulWidget {
  const RegisterEmail({
    super.key, required this.registerModel,
  });
  final UserInfoModel registerModel;

  @override
  State<RegisterEmail> createState() => _RegisterEmailState();
}

class _RegisterEmailState extends State<RegisterEmail> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText:  LocaleKeys.email.tr(),
      onChanged: (value) => email = value,
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
        widget.registerModel.email = value ;
        return null;
      },
    );
  }
}
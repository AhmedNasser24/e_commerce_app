import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

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
      hintText:  AppLocalizations.of(context)!.email,
      onChanged: (value) => email = value,
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
        widget.registerModel.email = value ;
        return null;
      },
    );
  }
}
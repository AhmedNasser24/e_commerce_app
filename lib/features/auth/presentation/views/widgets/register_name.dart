import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

import '../../../data/models/register_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class RegisterName extends StatefulWidget {
  const RegisterName({
    super.key, required this.registerModel,
  });

  final UserInfoModel registerModel;
  @override
  State<RegisterName> createState() => _RegisterNameState();
}

class _RegisterNameState extends State<RegisterName> {
  String name = '';
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText:  AppLocalizations.of(context)!.name,
      onChanged: (value) => name = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return AppLocalizations.of(context)!.required_field;
        }
        widget.registerModel.name = value ;
        return null;
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../generated/locale_keys.g.dart';
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
      hintText:  LocaleKeys.name.tr(),
      onChanged: (value) => name = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.required_field.tr();
        }
        widget.registerModel.name = value ;
        return null;
      },
    );
  }
}
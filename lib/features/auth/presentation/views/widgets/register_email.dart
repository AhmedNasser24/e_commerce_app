import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
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
      hintText:  S.of(context).email,
      onChanged: (value) => email = value,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field ;
        }
        widget.registerModel.email = value ;
        return null;
      },
    );
  }
}
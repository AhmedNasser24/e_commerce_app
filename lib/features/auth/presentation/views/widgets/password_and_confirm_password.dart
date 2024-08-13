
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/l10n.dart';
import '../../../data/models/register_model.dart';
import 'custom_text_form_field.dart';

class PasswordAndConfirmPassword extends StatefulWidget {
  const PasswordAndConfirmPassword({
    super.key, required this.registerModel,
  });
  final RegisterModel registerModel;

  @override
  State<PasswordAndConfirmPassword> createState() => _PasswordAndConfirmPasswordState();
}

class _PasswordAndConfirmPasswordState extends State<PasswordAndConfirmPassword> {
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(hintText: S.of(context).password,
        onChanged: (value) => password = value,
        validator: (value){
          if(value == null || value.isEmpty){
            return S.of(context).required_field;
          }
          if ( confirmPassword != password) {
            return S.of(context).passwords_do_not_match;
          }
          widget.registerModel.password = value;
          return null;
        },
        ),
        
        const Gap(10),
        Text(S.of(context).passwordConfirm),
        const Gap(5),
        CustomTextFormField(hintText: S.of(context).passwordConfirm,
        onChanged: (value) => confirmPassword = value,
        validator: (value){
          if(value == null || value.isEmpty){
            return S.of(context).required_field;
          }
          if ( confirmPassword != password) {
            return S.of(context).passwords_do_not_match;
          }
          return null;
        },
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/l10n.dart';
import 'custom_text_form_field.dart';

class PasswordAndConfirmPassword extends StatefulWidget {
  const PasswordAndConfirmPassword({
    super.key,
  });

  @override
  State<PasswordAndConfirmPassword> createState() => _PasswordAndConfirmPasswordState();
}

class _PasswordAndConfirmPasswordState extends State<PasswordAndConfirmPassword> {
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(hintText: S.of(context).password,
        onChanged: (value) => password = value,
        validator: (value){
          if(value == null || value.isEmpty){
            return S.of(context).required_field;
          }
          return null;
        },
        ),
        
        const Gap(10),
        Align(
            alignment: Alignment.centerRight,
            child: Text(S.of(context).passwordConfirm)),
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

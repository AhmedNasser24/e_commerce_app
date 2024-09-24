import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/register_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class PasswordAndConfirmPassword extends StatefulWidget {
  const PasswordAndConfirmPassword({
    super.key,
    required this.registerModel,
  });
  final UserInfoModel registerModel;

  @override
  State<PasswordAndConfirmPassword> createState() =>
      _PasswordAndConfirmPasswordState();
}

class _PasswordAndConfirmPasswordState
    extends State<PasswordAndConfirmPassword> {
  String password = '';
  String confirmPassword = '';
  bool isObscure1 = true, isObscure2 = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextFormField(
          obscureText: isObscure1,
          hintText: S.of(context).password,
          onChanged: (value) => password = value,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure1 = !isObscure1;
              });
            },
            icon: Icon(
              isObscure1 ? Icons.visibility_off : Icons.visibility,
              color: kPurpleColor,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).required_field;
            }
            if (confirmPassword != password) {
              return S.of(context).passwords_do_not_match;
            }
            widget.registerModel.password = value;
            return null;
          },
        ),
        const Gap(10),
        Text(S.of(context).passwordConfirm, style: AppStyle.medium14),
        const Gap(5),
        CustomTextFormField(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscure2 = !isObscure2;
              });
            },
            icon: Icon(
              isObscure2 ? Icons.visibility_off : Icons.visibility,
              color: kPurpleColor,
            ),
          ),
          obscureText: isObscure2,
          hintText: S.of(context).passwordConfirm,
          onChanged: (value) => confirmPassword = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).required_field;
            }
            if (confirmPassword != password) {
              return S.of(context).passwords_do_not_match;
            }
            return null;
          },
        ),
      ],
    );
  }
}

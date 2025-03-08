import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
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
          hintText: LocaleKeys.password.tr(),
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
              return LocaleKeys.required_field.tr();
            }
            if (confirmPassword != password) {
              return LocaleKeys.passwords_do_not_match.tr();
            }
            widget.registerModel.password = value;
            return null;
          },
        ),
        const Gap(10),
        Text(LocaleKeys.passwordConfirm.tr()  , style: AppStyle.medium14),
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
          hintText: LocaleKeys.passwordConfirm.tr(),
          onChanged: (value) => confirmPassword = value,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return LocaleKeys.required_field.tr();
            }
            if (confirmPassword != password) {
              return LocaleKeys.passwords_do_not_match.tr();
            }
            return null;
          },
        ),
      ],
    );
  }
}

import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import '../../../../../../generated/l10n.dart';
import '../../../data/models/login_model.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class LoginPassword extends StatefulWidget {
  const LoginPassword({
    super.key,
    required this.loginModel,
  });
  final LoginModel loginModel;

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  bool isObscure = true ;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: isObscure,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscure = !isObscure;
          });
        },
        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility ,
        color: kPurpleColor,
        ),
      ),
      hintText: S.of(context).password,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return S.of(context).required_field;
        }
        widget.loginModel.password = value ;
        return null;
      },
    );
  }
}

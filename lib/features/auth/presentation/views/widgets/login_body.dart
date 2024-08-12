import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../utils/core/app_style.dart';
import 'login_button.dart';
import 'login_email.dart';
import 'login_password.dart';
import 'navigate_to_register_view.dart';
import 'title_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});
  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40),
              const NavigateToRegisterView(),
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: TitleText(title: S.of(context).login),
              ),
              const Gap(50),
              Text(S.of(context).email, style: AppStyle.medium14),
              const Gap(5),
              const LoginEmail(),
              const Gap(10),
              Text(S.of(context).password, style: AppStyle.medium14),
              const Gap(5),
              const LoginPassword(),
              const Gap(50),
              Align(
                alignment: Alignment.center,
                child: LoginButton(formKey: formKey),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}

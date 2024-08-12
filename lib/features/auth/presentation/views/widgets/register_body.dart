import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/core/app_style.dart';
import 'account_kind.dart';
import 'password_and_confirm_password.dart';
import 'register_button.dart';
import 'register_email.dart';
import 'register_name.dart';
import 'title_text.dart';
import 'whatsapp_number.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return 
      Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                Align(
                  alignment: Alignment.center,
                  child: TitleText(title: S.of(context).register),
                ),
                const Gap(30),
                Text(S.of(context).name   , style : AppStyle.medium14),
                const Gap(5),
                const RegisterName(),
                const Gap(10),
                Text(S.of(context).email  , style : AppStyle.medium14),
                const Gap(5),
                const RegisterEmail(),
                const Gap(10),
                Text(S.of(context).password , style : AppStyle.medium14),
                const Gap(5),
                const PasswordAndConfirmPassword(),
                const Gap(10),
                Text(S.of(context).whatsapp_number , style : AppStyle.medium14),
                const Gap(5),
                const WhatsAppNumber(),
                const Gap(10),
                Text(S.of(context).account_kind),
                const Gap(5),
                const AccountKind(),
                const Gap(50),
                Align(
                  alignment: Alignment.center,
                  child: RegisterButton(formKey: formKey),
                ),
                const Gap(50),
              ],
            ),
          ),
        ),
      
    );
  }
}

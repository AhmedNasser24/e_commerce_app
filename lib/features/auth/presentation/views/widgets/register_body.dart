import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

import '../../../../../core/utils/app_style.dart';
import 'account_kind_for_register.dart';
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
  UserInfoModel registerModel = UserInfoModel();
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
              const Gap(50),
              Align(
                alignment: Alignment.center,
                child: TitleText(title: AppLocalizations.of(context)!.register),
              ),
              const Gap(30),
              Text(AppLocalizations.of(context)!.name, style: AppStyle.medium14),
              const Gap(5),
              RegisterName(registerModel: registerModel),
              const Gap(10),
              Text(AppLocalizations.of(context)!.email, style: AppStyle.medium14),
              const Gap(5),
              RegisterEmail(registerModel: registerModel),
              const Gap(10),
              Text(AppLocalizations.of(context)!.password, style: AppStyle.medium14),
              const Gap(5),
              PasswordAndConfirmPassword(registerModel: registerModel),
              const Gap(10),
              Text(AppLocalizations.of(context)!.whatsapp_number, style: AppStyle.medium14),
              const Gap(5),
              WhatsAppNumber(registerModel: registerModel),
              const Gap(10),
              Text(AppLocalizations.of(context)!.account_kind, style: AppStyle.medium14),
              const Gap(5),
              AccountKindForRegister(registerModel: registerModel),
              const Gap(50),
              Align(
                alignment: Alignment.center,
                child: RegisterButton(
                    formKey: formKey, registerModel: registerModel),
              ),
              const Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}

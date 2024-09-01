import 'package:e_commerce/features/auth/presentation/views/widgets/account_kind_for_login.dart';
import 'package:e_commerce/features/moyasar_payment/presentation/views/moyasar_payment_view.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../data/models/login_model.dart';
import 'login_button.dart';
import 'login_email.dart';
import 'login_password.dart';
import 'title_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key, required this.changeLanguage});
  final void Function(Locale newLocale) changeLanguage;

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel loginModel = LoginModel();

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
              
              const Gap(20),
              Align(
                alignment: Alignment.center,
                child: TitleText(title: S.of(context).login),
              ),
              const Gap(50),
              Text(S.of(context).email, style: AppStyle.medium14),
              const Gap(5),
              LoginEmail(loginModel: loginModel),
              const Gap(10),
              Text(S.of(context).password, style: AppStyle.medium14),
              const Gap(5),
              LoginPassword(loginModel: loginModel),
              const Gap(10),
              Text(S.of(context).account_kind, style: AppStyle.medium14),
              const Gap(5),
              AccountKindForLogin(loginModel: loginModel),
              const Gap(50),
              Align(
                alignment: Alignment.center,
                child: LoginButton(
                  formKey: formKey,
                  loginModel: loginModel,
                  changeLanguage: widget.changeLanguage,
                ),
              ),
              const Gap(40),

              // PaymentMethods()
            ],
          ),
        ),
      ),
    );
  }
}

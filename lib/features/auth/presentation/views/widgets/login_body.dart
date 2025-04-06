// import 'package:e_commerce/core/utils/notification_service.dart';
import 'package:e_commerce/core/manager/locale_cubit/locale_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/account_kind_for_login.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../data/models/login_model.dart';
import 'login_button.dart';
import 'login_email.dart';
import 'login_password.dart';
import 'title_text.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({
    super.key,
  });

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginModel loginModel = LoginModel();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocaleCubit, LocaleState>(
      listener: (context, state) {
        if (state is LocaleSuccess) {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginView())); // to rebuild screen with new language
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(40),
                  Align(
                    alignment: Alignment.center,
                    child: TitleText(title: LocaleKeys.login.tr()),
                  ),
                  const Gap(50),
                  Text(LocaleKeys.email.tr(), style: AppStyle.medium14),
                  const Gap(5),
                  LoginEmail(loginModel: loginModel),
                  const Gap(10),
                  Text(LocaleKeys.password.tr(), style: AppStyle.medium14),
                  const Gap(5),
                  LoginPassword(loginModel: loginModel),
                  const Gap(10),
                  Text(LocaleKeys.account_kind.tr(), style: AppStyle.medium14),
                  const Gap(5),
                  AccountKindForLogin(loginModel: loginModel),
                  const Gap(50),
                  Align(
                    alignment: Alignment.center,
                    child: LoginButton(
                      formKey: formKey,
                      loginModel: loginModel,
                    ),
                  ),
                  const Gap(40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:e_commerce/features/auth/data/models/register_model.dart';
import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/utils/core/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
  RegisterModel registerModel = RegisterModel();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true ;
        }else if (state is AuthFailure){
          isLoading = false ;
          showSnackBar(context, state.errMessage) ;
        }else if (state is AuthSuccess){
          isLoading = false ;
          Navigator.pop(context) ;
        }else {
          isLoading = false ;
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          child: ModalProgressHUD(
            inAsyncCall: isLoading,
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
                    Text(S.of(context).name, style: AppStyle.medium14),
                    const Gap(5),
                    RegisterName(registerModel: registerModel),
                    const Gap(10),
                    Text(S.of(context).email, style: AppStyle.medium14),
                    const Gap(5),
                    RegisterEmail(registerModel: registerModel),
                    const Gap(10),
                    Text(S.of(context).password, style: AppStyle.medium14),
                    const Gap(5),
                    PasswordAndConfirmPassword(registerModel: registerModel),
                    const Gap(10),
                    Text(S.of(context).whatsapp_number,
                        style: AppStyle.medium14),
                    const Gap(5),
                    WhatsAppNumber(registerModel: registerModel),
                    const Gap(10),
                    Text(S.of(context).account_kind),
                    const Gap(5),
                    AccountKind(registerModel: registerModel),
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
          ),
        );
      },
    );
  }
}

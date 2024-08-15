import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/login_model.dart';
import '../../manager/auth_cubit/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.loginModel,
  });

  final GlobalKey<FormState> formKey;
  final LoginModel loginModel;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
        } else if (state is AuthFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        } else if (state is AuthSuccess) {
          isLoading = false;
          // navigate to home ;
          debugPrint("login success");
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context)
                  .login(loginModel: loginModel, context);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(218, 182, 165, 71)),
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(S.of(context).login, style: AppStyle.medium20),
          ),
        );
      },
    );
  }
}

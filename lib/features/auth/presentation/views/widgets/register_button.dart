import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../data/models/register_model.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.registerModel,
  });
  final RegisterModel registerModel;
  final GlobalKey<FormState> formKey;

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
          Navigator.pop(context);
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context)
                  .register(registerModel: registerModel, context);
            } else {
              formKey.currentState!.save();
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(218, 182, 165, 71)),
            child: isLoading
                ? const CircularProgressIndicator()
                : Text(S.of(context).register, style: AppStyle.medium20),
          ),
        );
      },
    );
  }
}

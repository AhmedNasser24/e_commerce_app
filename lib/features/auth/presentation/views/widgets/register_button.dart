import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/core/app_style.dart';
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
    return GestureDetector(
      onTap: () {
        if (formKey.currentState!.validate()) {
          BlocProvider.of<AuthCubit>(context)
              .register(registerModel: registerModel, context);
          print('valid');
        } else {
          formKey.currentState!.save();
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(218, 182, 165, 71)),
        child: Text(S.of(context).register, style: AppStyle.regular16),
      ),
    );
  }
}

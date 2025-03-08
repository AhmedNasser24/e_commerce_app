import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/register_model.dart';

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    super.key,
    required this.formKey,
    required this.registerModel,
  });
  final UserInfoModel registerModel;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        } else if (state is RegisterSuccess) {
          isLoading = false;
          Navigator.pop(context);
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: LocaleKeys.register.tr(),
          isLoading: isLoading,
          horizontalMargin: 40,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context)
                  .register(userInfo: registerModel, context);
            } else {
              formKey.currentState!.save();
            }
          },
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../data/models/register_model.dart';
import '../../manager/register_cubit/register_cubit.dart';

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
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        } else if (state is RegisterSuccess) {
          isLoading = false;
          showSnackBar(context, AppLocalizations.of(context)!.register_success);
          Navigator.pop(context);
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: AppLocalizations.of(context)!.register,
          isLoading: isLoading,
          horizontalMargin: 40,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<RegisterCubit>(context)
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

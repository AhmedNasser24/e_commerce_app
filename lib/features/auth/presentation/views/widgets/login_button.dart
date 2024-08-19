import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../generated/l10n.dart';
import '../../../../trader/presentation/views/trader_home_view.dart';
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
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const TraderHomeView()),
            (route) => false,
          );
          debugPrint("login success");
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: S.of(context).login,
          isLoading: isLoading,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<AuthCubit>(context)
                  .login(loginModel: loginModel, context);
            }
          },
        );
      },
    );
  }
}

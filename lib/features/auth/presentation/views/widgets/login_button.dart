import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/customer_home_view_bloc_provider.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/trader_home_view_bloc_provider.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../data/models/login_model.dart';
import '../../manager/login_cubit/login_cubit.dart';

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
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          isLoading = true;
        } else if (state is LoginFailure) {
          isLoading = false;
          showSnackBar(context, state.errMessage);
        } else if (state is LoginSuccess) {
          isLoading = false;
          Navigator.pushNamedAndRemoveUntil(
            context,

            // check if this email is for customer or trader
            (loginModel.accountKind == kTraderAccountKindEnglish ||
                    loginModel.accountKind == kTraderAccountKindArabic)
                ? TraderHomeViewBlocProvider.routeName
                : CustomerHomeViewBlocProvider.routeName,

            (route) => false,
          );
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: LocaleKeys.login.tr(),
          isLoading: isLoading,
          horizontalMargin: 40,
          onTap: () {
            if (formKey.currentState!.validate()) {
              BlocProvider.of<LoginCubit>(context)
                  .login(loginModel: loginModel, context);
            }
          },
        );
      },
    );
  }
}

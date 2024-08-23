import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../generated/l10n.dart';
import '../utils/app_style.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // loading is in trader view or customer view
        if (state is AuthSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const LoginView()),
            (route) =>
                false, // Returning false will remove all previous routes from the stack
          );
        }
      },
      child: ListTile(
        onTap: () {
          showAwesomeDialog(context);
        },
        title: Text(
          S.of(context).sign_out,
          style: AppStyle.semiBold16,
        ),
        leading: const Icon(Icons.logout),
      ),
    );
  }

  void showAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: S.of(context).sign_out,
      desc: S.of(context).are_you_sure_you_want_to_signOut,
      btnOkText: S.of(context).ok,
      btnCancelText: S.of(context).cancel,
      btnOkOnPress: () {
        BlocProvider.of<AuthCubit>(context).signOut();
      },
      btnCancelOnPress: () {},
    ).show();
  }
}

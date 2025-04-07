import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants.dart';
import '../utils/app_style.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignOutCubit, SignOutState>(
      listener: (context, state) {
        // loading is in trader view or customer view
        if (state is SignOutSuccess) {
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
          LocaleKeys.sign_out.tr(),
          style: AppStyle.semiBold16,
        ),
        leading: const Icon(Icons.logout, color: kPurpleColor),
      ),
    );
  }

  void showAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: LocaleKeys.sign_out.tr(),
      desc: LocaleKeys.are_you_sure_you_want_to_signOut.tr(),
      btnOkText: LocaleKeys.ok.tr(),
      btnCancelText: LocaleKeys.cancel.tr(),
      btnOkOnPress: () {
        BlocProvider.of<SignOutCubit>(context).signOut();
      },
      btnCancelOnPress: () {},
    ).show();
  }
}

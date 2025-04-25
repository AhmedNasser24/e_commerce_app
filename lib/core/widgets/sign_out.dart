import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/features/auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/login_view.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
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
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginView.routeName,
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
          AppLocalizations.of(context)!.sign_out,
          style: AppStyle.semiBold16,
        ),
        leading: const Icon(Icons.logout, color: kPurpleColor),
      ),
    );
  }

  void showAwesomeDialog(context) {
    AwesomeDialog(
      width: kMaxWidthForDialog,
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: AppLocalizations.of(context)!.sign_out,
      desc: AppLocalizations.of(context)!.are_you_sure_you_want_to_signOut,
      btnOkText: AppLocalizations.of(context)!.ok,
      btnCancelText: AppLocalizations.of(context)!.cancel,
      btnOkOnPress: () {
        BlocProvider.of<SignOutCubit>(context).signOut();
      },
      btnCancelOnPress: () {
        Navigator.pop(context) ;
      },
    ).show();
  }
}

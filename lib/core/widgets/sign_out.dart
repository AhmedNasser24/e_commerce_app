import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_style.dart';

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){

      },
      title: Text(
        S.of(context).sign_out,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.logout),
    );
  }

  void showAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      title: S.of(context).thank_you,
      desc: 'We will contact you within 24 hours',
      btnOkOnPress: () {
        // Navigator.
      },
      btnCancelOnPress: () {},
    ).show();
  }
}
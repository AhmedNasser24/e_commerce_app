import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../generated/l10n.dart';
import '../../local_cubit.dart';
import '../utils/app_style.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _showLanguageDialog(context),
      title: Text(
        S.of(context).language,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.translate, color: kPurpleColor),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Align(
            alignment: Alignment.topCenter,
            child: Text(S.of(context).language, style: AppStyle.bold18),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(S.of(context).arabic, style: AppStyle.semiBold14),
                onTap: () {
                  BlocProvider.of<LocalCubit>(context)
                      .changeLanguage(context , const Locale('ar'));
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).english, style: AppStyle.semiBold14),
                onTap: () {
                  BlocProvider.of<LocalCubit>(context)
                      .changeLanguage(context , const Locale('en'));

                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

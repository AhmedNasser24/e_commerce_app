import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../utils/app_style.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({
    super.key,
    required this.changeLanguage,
  });
  final void Function(Locale newLocale) changeLanguage;
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
                title: Text(S.of(context).arabic , style : AppStyle.semiBold14),
                onTap: () {
                  changeLanguage(const Locale('ar'));
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).english, style : AppStyle.semiBold14),
                onTap: () {
                  changeLanguage(const Locale('en'));
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

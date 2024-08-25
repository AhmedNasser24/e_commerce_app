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
      leading: const Icon(Icons.language),
    );
  }

  
  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text(S.of(context).arabic),
                onTap: () {
                  changeLanguage(const Locale('ar'));
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(S.of(context).english),
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

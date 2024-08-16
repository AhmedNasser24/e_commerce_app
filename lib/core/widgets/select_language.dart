
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_style.dart';

class SelectLanguage extends StatelessWidget {
  const SelectLanguage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        S.of(context).language,
        style: AppStyle.semiBold16,
      ),
      leading: const Icon(Icons.language),
    );
  }
}
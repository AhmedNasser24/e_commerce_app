import 'package:e_commerce/l10n/app_localizations.dart';

List<String> categoryList(context) {
  List<String> categoryList = [
    AppLocalizations.of(context)!.electronics_category,
    AppLocalizations.of(context)!.clothes_category,
    AppLocalizations.of(context)!.shoes_category,
    AppLocalizations.of(context)!.jewellary_category,
  ];
  return categoryList;
}
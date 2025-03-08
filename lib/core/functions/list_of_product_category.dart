import 'package:easy_localization/easy_localization.dart';
import '../../../../../generated/locale_keys.g.dart';

List<String> categoryList(context) {
  List<String> categoryList = [
    LocaleKeys.electronics_category.tr(),
    LocaleKeys.clothes_category.tr(),
    LocaleKeys.shoes_category.tr(),
    LocaleKeys.jewellary_category.tr(),
  ];
  return categoryList;
}
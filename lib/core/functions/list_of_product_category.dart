import '../../generated/l10n.dart';

List < String > categoryList(context){
  List < String > categoryList = [
    S.of(context).all_category,
    S.of(context).electronics_category,
    S.of(context).clothes_category,
    S.of(context).shoes_category,
    S.of(context).jewellary_category,
  ];
  return categoryList;
}
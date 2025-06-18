import 'package:flutter/material.dart';

String changePriceLanguage(String price, BuildContext context) {
  if (isLocalizationArabic(context)) {
    return changeNumToArabic(price);
  } else {
    return changeNumToEnglish(price);
  }
}

bool isLocalizationArabic(BuildContext context) {
  return Localizations.localeOf(context).languageCode == 'ar';
}

String changeNumToArabic(String text) {
  final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  final englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  for (int i = 0; i < englishNumbers.length; i++) {
    text = text.replaceAll(englishNumbers[i], arabicNumbers[i]);
  }
  return text;
}

String changeNumToEnglish(String text) {
  final arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
  final englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  for (int i = 0; i < arabicNumbers.length; i++) {
    text = text.replaceAll(arabicNumbers[i], englishNumbers[i]);
  }
  return text;
}

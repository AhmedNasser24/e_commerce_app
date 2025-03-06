import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCubit extends Cubit<Locale> {
  LocalCubit() : super(const Locale('en'));

  void changeLanguage(BuildContext context, Locale newLocale) {
    if (context.locale == newLocale) return;
    context.setLocale(newLocale);
    emit(newLocale);
  }
}

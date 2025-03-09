
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
    void changeLanguage(BuildContext context, Locale newLocale) {
    if (context.locale == newLocale) return;
    emit(LocaleLoading());
    context.setLocale(newLocale);
    emit(LocaleSuccess());
  }
}

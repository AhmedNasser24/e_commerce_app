
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleInitial());
    Locale currentLocale = const Locale('en');
    void changeLanguage(BuildContext context, Locale newLocale) {
    emit(LocaleLoading());
    currentLocale = newLocale;
    emit(LocaleSuccess());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocalCubit extends Cubit<Locale> {
  LocalCubit() : super(const Locale('en'));

  void changeLanguage(Locale newLocale) {
    emit(newLocale);
  }
}
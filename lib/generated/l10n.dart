// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `name`
  String get name {
    return Intl.message(
      'name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `confirm password`
  String get passwordConfirm {
    return Intl.message(
      'confirm password',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `whatsapp number`
  String get whatsapp_number {
    return Intl.message(
      'whatsapp number',
      name: 'whatsapp_number',
      desc: '',
      args: [],
    );
  }

  /// `required field`
  String get required_field {
    return Intl.message(
      'required field',
      name: 'required_field',
      desc: '',
      args: [],
    );
  }

  /// `phone number must be at least 11 characters`
  String get phone_number_must_be_at_least_11_characters {
    return Intl.message(
      'phone number must be at least 11 characters',
      name: 'phone_number_must_be_at_least_11_characters',
      desc: '',
      args: [],
    );
  }

  /// `passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `account_kind`
  String get account_kind {
    return Intl.message(
      'account_kind',
      name: 'account_kind',
      desc: '',
      args: [],
    );
  }

  /// `trader`
  String get trader {
    return Intl.message(
      'trader',
      name: 'trader',
      desc: '',
      args: [],
    );
  }

  /// `customer`
  String get customer {
    return Intl.message(
      'customer',
      name: 'customer',
      desc: '',
      args: [],
    );
  }

  /// `please check your email for verification`
  String get please_check_your_email_for_verification {
    return Intl.message(
      'please check your email for verification',
      name: 'please_check_your_email_for_verification',
      desc: '',
      args: [],
    );
  }

  /// `My Shop`
  String get my_shop {
    return Intl.message(
      'My Shop',
      name: 'my_shop',
      desc: '',
      args: [],
    );
  }

  /// `Shop`
  String get shop {
    return Intl.message(
      'Shop',
      name: 'shop',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get electronics_category {
    return Intl.message(
      'Electronics',
      name: 'electronics_category',
      desc: '',
      args: [],
    );
  }

  /// `Clothes`
  String get clothes_category {
    return Intl.message(
      'Clothes',
      name: 'clothes_category',
      desc: '',
      args: [],
    );
  }

  /// `Jewellary`
  String get jewellary_category {
    return Intl.message(
      'Jewellary',
      name: 'jewellary_category',
      desc: '',
      args: [],
    );
  }

  /// `Shoes`
  String get shoes_category {
    return Intl.message(
      'Shoes',
      name: 'shoes_category',
      desc: '',
      args: [],
    );
  }

  /// `Product category`
  String get product_category {
    return Intl.message(
      'Product category',
      name: 'product_category',
      desc: '',
      args: [],
    );
  }

  /// `Product name`
  String get product_name {
    return Intl.message(
      'Product name',
      name: 'product_name',
      desc: '',
      args: [],
    );
  }

  /// `Product price`
  String get product_price {
    return Intl.message(
      'Product price',
      name: 'product_price',
      desc: '',
      args: [],
    );
  }

  /// `Product image`
  String get product_image {
    return Intl.message(
      'Product image',
      name: 'product_image',
      desc: '',
      args: [],
    );
  }

  /// `From Camera`
  String get from_camera {
    return Intl.message(
      'From Camera',
      name: 'from_camera',
      desc: '',
      args: [],
    );
  }

  /// `from Gallery`
  String get from_gallery {
    return Intl.message(
      'from Gallery',
      name: 'from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `image isadded`
  String get image_is_added {
    return Intl.message(
      'image isadded',
      name: 'image_is_added',
      desc: '',
      args: [],
    );
  }

  /// `image is not_added`
  String get image_is_not_added {
    return Intl.message(
      'image is not_added',
      name: 'image_is_not_added',
      desc: '',
      args: [],
    );
  }

  /// `Add product`
  String get add_product {
    return Intl.message(
      'Add product',
      name: 'add_product',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

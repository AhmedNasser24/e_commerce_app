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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get passwordConfirm {
    return Intl.message(
      'Confirm password',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Whatsapp number`
  String get whatsapp_number {
    return Intl.message(
      'Whatsapp number',
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

  /// `Account_kind`
  String get account_kind {
    return Intl.message(
      'Account_kind',
      name: 'account_kind',
      desc: '',
      args: [],
    );
  }

  /// `Trader`
  String get trader {
    return Intl.message(
      'Trader',
      name: 'trader',
      desc: '',
      args: [],
    );
  }

  /// `Customer`
  String get customer {
    return Intl.message(
      'Customer',
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

  /// `All`
  String get all_category {
    return Intl.message(
      'All',
      name: 'all_category',
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

  /// `From Gallery`
  String get from_gallery {
    return Intl.message(
      'From Gallery',
      name: 'from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `image is added`
  String get image_is_added {
    return Intl.message(
      'image is added',
      name: 'image_is_added',
      desc: '',
      args: [],
    );
  }

  /// `image is not added`
  String get image_is_not_added {
    return Intl.message(
      'image is not added',
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

  /// `Edit product`
  String get edit_product {
    return Intl.message(
      'Edit product',
      name: 'edit_product',
      desc: '',
      args: [],
    );
  }

  /// `LE`
  String get LE {
    return Intl.message(
      'LE',
      name: 'LE',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message(
      'Sign out',
      name: 'sign_out',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `New orders`
  String get new_orders {
    return Intl.message(
      'New orders',
      name: 'new_orders',
      desc: '',
      args: [],
    );
  }

  /// `Old orders`
  String get old_orders {
    return Intl.message(
      'Old orders',
      name: 'old_orders',
      desc: '',
      args: [],
    );
  }

  /// `My orders`
  String get my_orders {
    return Intl.message(
      'My orders',
      name: 'my_orders',
      desc: '',
      args: [],
    );
  }

  /// `Add to card`
  String get add_to_card {
    return Intl.message(
      'Add to card',
      name: 'add_to_card',
      desc: '',
      args: [],
    );
  }

  /// `Remove`
  String get remove_from_card {
    return Intl.message(
      'Remove',
      name: 'remove_from_card',
      desc: '',
      args: [],
    );
  }

  /// `Product is added successfully`
  String get product_is_added_successfully {
    return Intl.message(
      'Product is added successfully',
      name: 'product_is_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `My Cart`
  String get my_cart {
    return Intl.message(
      'My Cart',
      name: 'my_cart',
      desc: '',
      args: [],
    );
  }

  /// `Product is added to cart`
  String get product_is_added_to_cart {
    return Intl.message(
      'Product is added to cart',
      name: 'product_is_added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Error: Product isn't added to cart`
  String get error_product_is_not_added_to_cart {
    return Intl.message(
      'Error: Product isn\'t added to cart',
      name: 'error_product_is_not_added_to_cart',
      desc: '',
      args: [],
    );
  }

  /// `Product is removed from cart`
  String get product_is_removed_from_cart {
    return Intl.message(
      'Product is removed from cart',
      name: 'product_is_removed_from_cart',
      desc: '',
      args: [],
    );
  }

  /// `Error: Product isn't removed from cart`
  String get error_product_is_not_removed_from_cart {
    return Intl.message(
      'Error: Product isn\'t removed from cart',
      name: 'error_product_is_not_removed_from_cart',
      desc: '',
      args: [],
    );
  }

  /// `Buy`
  String get buy {
    return Intl.message(
      'Buy',
      name: 'buy',
      desc: '',
      args: [],
    );
  }

  /// `Total price`
  String get total_price {
    return Intl.message(
      'Total price',
      name: 'total_price',
      desc: '',
      args: [],
    );
  }

  /// `We will contact you within 24 hours`
  String get we_will_contact_you_within_24_hours {
    return Intl.message(
      'We will contact you within 24 hours',
      name: 'we_will_contact_you_within_24_hours',
      desc: '',
      args: [],
    );
  }

  /// `Thank you`
  String get thank_you {
    return Intl.message(
      'Thank you',
      name: 'thank_you',
      desc: '',
      args: [],
    );
  }

  /// `Number of products`
  String get num_of_products {
    return Intl.message(
      'Number of products',
      name: 'num_of_products',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get news {
    return Intl.message(
      'New',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to signOut`
  String get are_you_sure_you_want_to_signOut {
    return Intl.message(
      'Are you sure you want to signOut',
      name: 'are_you_sure_you_want_to_signOut',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Is it delivered ?`
  String get is_it_delivered {
    return Intl.message(
      'Is it delivered ?',
      name: 'is_it_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Delivered`
  String get delivered {
    return Intl.message(
      'Delivered',
      name: 'delivered',
      desc: '',
      args: [],
    );
  }

  /// `Not delivered`
  String get not_delivered {
    return Intl.message(
      'Not delivered',
      name: 'not_delivered',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Not yet`
  String get not_yet {
    return Intl.message(
      'Not yet',
      name: 'not_yet',
      desc: '',
      args: [],
    );
  }

  /// `Did you sent orders to`
  String get did_you_sent_orders_to {
    return Intl.message(
      'Did you sent orders to',
      name: 'did_you_sent_orders_to',
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

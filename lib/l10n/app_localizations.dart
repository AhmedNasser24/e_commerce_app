import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'name'**
  String get name;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get passwordConfirm;

  /// No description provided for @whatsapp_number.
  ///
  /// In en, this message translates to:
  /// **'Whatsapp number'**
  String get whatsapp_number;

  /// No description provided for @required_field.
  ///
  /// In en, this message translates to:
  /// **'required field'**
  String get required_field;

  /// No description provided for @phone_number_must_be_at_least_11_characters.
  ///
  /// In en, this message translates to:
  /// **'phone number must be at least 11 characters'**
  String get phone_number_must_be_at_least_11_characters;

  /// No description provided for @passwords_do_not_match.
  ///
  /// In en, this message translates to:
  /// **'passwords do not match'**
  String get passwords_do_not_match;

  /// No description provided for @account_kind.
  ///
  /// In en, this message translates to:
  /// **'Account_kind'**
  String get account_kind;

  /// No description provided for @trader.
  ///
  /// In en, this message translates to:
  /// **'Trader'**
  String get trader;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @please_check_your_email_for_verification.
  ///
  /// In en, this message translates to:
  /// **'please check your email for verification'**
  String get please_check_your_email_for_verification;

  /// No description provided for @my_shop.
  ///
  /// In en, this message translates to:
  /// **'My Shop'**
  String get my_shop;

  /// No description provided for @shop.
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get shop;

  /// No description provided for @all_category.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all_category;

  /// No description provided for @electronics_category.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics_category;

  /// No description provided for @clothes_category.
  ///
  /// In en, this message translates to:
  /// **'Clothes'**
  String get clothes_category;

  /// No description provided for @jewellary_category.
  ///
  /// In en, this message translates to:
  /// **'Jewellary'**
  String get jewellary_category;

  /// No description provided for @shoes_category.
  ///
  /// In en, this message translates to:
  /// **'Shoes'**
  String get shoes_category;

  /// No description provided for @product_category.
  ///
  /// In en, this message translates to:
  /// **'Product category'**
  String get product_category;

  /// No description provided for @product_name.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get product_name;

  /// No description provided for @product_price.
  ///
  /// In en, this message translates to:
  /// **'Product price'**
  String get product_price;

  /// No description provided for @product_image.
  ///
  /// In en, this message translates to:
  /// **'Product image'**
  String get product_image;

  /// No description provided for @from_camera.
  ///
  /// In en, this message translates to:
  /// **'From Camera'**
  String get from_camera;

  /// No description provided for @from_gallery.
  ///
  /// In en, this message translates to:
  /// **'From Gallery'**
  String get from_gallery;

  /// No description provided for @image_is_added.
  ///
  /// In en, this message translates to:
  /// **'image is added successfully'**
  String get image_is_added;

  /// No description provided for @image_is_not_added.
  ///
  /// In en, this message translates to:
  /// **'Error : image is not added'**
  String get image_is_not_added;

  /// No description provided for @add_product.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get add_product;

  /// No description provided for @edit_product.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get edit_product;

  /// No description provided for @le.
  ///
  /// In en, this message translates to:
  /// **'LE'**
  String get le;

  /// No description provided for @sign_out.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get sign_out;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No description provided for @new_orders.
  ///
  /// In en, this message translates to:
  /// **'New orders'**
  String get new_orders;

  /// No description provided for @old_orders.
  ///
  /// In en, this message translates to:
  /// **'Old orders'**
  String get old_orders;

  /// No description provided for @my_orders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get my_orders;

  /// No description provided for @add_to_card.
  ///
  /// In en, this message translates to:
  /// **'Add to card'**
  String get add_to_card;

  /// No description provided for @remove_from_card.
  ///
  /// In en, this message translates to:
  /// **'Remove'**
  String get remove_from_card;

  /// No description provided for @product_is_added_successfully.
  ///
  /// In en, this message translates to:
  /// **'Product is added successfully'**
  String get product_is_added_successfully;

  /// No description provided for @my_cart.
  ///
  /// In en, this message translates to:
  /// **'My Cart'**
  String get my_cart;

  /// No description provided for @product_is_added_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Product is added to cart'**
  String get product_is_added_to_cart;

  /// No description provided for @error_product_is_not_added_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Error: Product isn\'t added to cart'**
  String get error_product_is_not_added_to_cart;

  /// No description provided for @product_is_removed_from_cart.
  ///
  /// In en, this message translates to:
  /// **'Product is removed from cart'**
  String get product_is_removed_from_cart;

  /// No description provided for @error_product_is_not_removed_from_cart.
  ///
  /// In en, this message translates to:
  /// **'Error: Product isn\'t removed from cart'**
  String get error_product_is_not_removed_from_cart;

  /// No description provided for @buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get buy;

  /// No description provided for @total_price.
  ///
  /// In en, this message translates to:
  /// **'Total price'**
  String get total_price;

  /// No description provided for @we_will_contact_you_within_24_hours.
  ///
  /// In en, this message translates to:
  /// **'We will contact you within 24 hours'**
  String get we_will_contact_you_within_24_hours;

  /// No description provided for @thank_you.
  ///
  /// In en, this message translates to:
  /// **'Thank you'**
  String get thank_you;

  /// No description provided for @num_of_products.
  ///
  /// In en, this message translates to:
  /// **'Number of products'**
  String get num_of_products;

  /// No description provided for @news.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get news;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @are_you_sure_you_want_to_signOut.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to signOut'**
  String get are_you_sure_you_want_to_signOut;

  /// No description provided for @invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get invalid_email;

  /// No description provided for @is_it_delivered.
  ///
  /// In en, this message translates to:
  /// **'Is it delivered ?'**
  String get is_it_delivered;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @not_delivered.
  ///
  /// In en, this message translates to:
  /// **'Not delivered'**
  String get not_delivered;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @not_yet.
  ///
  /// In en, this message translates to:
  /// **'Not yet'**
  String get not_yet;

  /// No description provided for @did_you_sent_orders_to.
  ///
  /// In en, this message translates to:
  /// **'Did you sent orders to'**
  String get did_you_sent_orders_to;

  /// No description provided for @no_orders_yet.
  ///
  /// In en, this message translates to:
  /// **'No orders yet'**
  String get no_orders_yet;

  /// No description provided for @all_last_orders_have_been_delivered_to_you.
  ///
  /// In en, this message translates to:
  /// **'All last orders have been delivered to you'**
  String get all_last_orders_have_been_delivered_to_you;

  /// No description provided for @confirm_order.
  ///
  /// In en, this message translates to:
  /// **'Confirm order'**
  String get confirm_order;

  /// No description provided for @do_you_want_to_confirm_your_order_purchase.
  ///
  /// In en, this message translates to:
  /// **'Do you want to confirm your order purchase?'**
  String get do_you_want_to_confirm_your_order_purchase;

  /// No description provided for @are_you_sure_you_want_to_delete_this_product.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this product?'**
  String get are_you_sure_you_want_to_delete_this_product;

  /// No description provided for @are_you_sure_you_want_to_edit_this_product.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to edit this product?'**
  String get are_you_sure_you_want_to_edit_this_product;

  /// No description provided for @are_you_sure_you_want_to_add_this_product.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to add this product?'**
  String get are_you_sure_you_want_to_add_this_product;

  /// No description provided for @no_product_found.
  ///
  /// In en, this message translates to:
  /// **'No product found'**
  String get no_product_found;

  /// No description provided for @product_is_edited_successfully.
  ///
  /// In en, this message translates to:
  /// **'Product is edited successfully'**
  String get product_is_edited_successfully;

  /// No description provided for @new_product_is_added.
  ///
  /// In en, this message translates to:
  /// **'New product is added'**
  String get new_product_is_added;

  /// No description provided for @error_new_product_is_not_added.
  ///
  /// In en, this message translates to:
  /// **'Error: New Product is not added'**
  String get error_new_product_is_not_added;

  /// No description provided for @error_product_is_not_edited.
  ///
  /// In en, this message translates to:
  /// **'Error: Product is not edited'**
  String get error_product_is_not_edited;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @add_image.
  ///
  /// In en, this message translates to:
  /// **'Add image'**
  String get add_image;

  /// No description provided for @product_desc.
  ///
  /// In en, this message translates to:
  /// **'Product description'**
  String get product_desc;

  /// No description provided for @login_first.
  ///
  /// In en, this message translates to:
  /// **'Login first'**
  String get login_first;

  /// No description provided for @empty.
  ///
  /// In en, this message translates to:
  /// **'Empty'**
  String get empty;

  /// No description provided for @register_success.
  ///
  /// In en, this message translates to:
  /// **'Registration is successful'**
  String get register_success;

  /// No description provided for @splash_title.
  ///
  /// In en, this message translates to:
  /// **'E-Commerce'**
  String get splash_title;

  /// No description provided for @splash_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Trader & Customer can use this app to sell and buy products'**
  String get splash_subtitle;

  /// No description provided for @onboarding_title.
  ///
  /// In en, this message translates to:
  /// **'Welcome to the E-Commerce'**
  String get onboarding_title;

  /// No description provided for @onboarding_subtitle1.
  ///
  /// In en, this message translates to:
  /// **'In this app , Traders can upload their products with there prefered details and prices to sell them'**
  String get onboarding_subtitle1;

  /// No description provided for @onboarding_subtitle2.
  ///
  /// In en, this message translates to:
  /// **'Customers can buy products from different categories , add them to their cart , view their orders and confirm them after receiving them'**
  String get onboarding_subtitle2;

  /// No description provided for @onboarding_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboarding_next;

  /// No description provided for @onboarding_start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get onboarding_start;

  /// No description provided for @invalid_price.
  ///
  /// In en, this message translates to:
  /// **'Invalid price'**
  String get invalid_price;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get no_internet_connection;

  /// No description provided for @failure_invalid_email.
  ///
  /// In en, this message translates to:
  /// **'Invalid email , email should be : email_name@*****.com'**
  String get failure_invalid_email;

  /// No description provided for @failure_invalid_password.
  ///
  /// In en, this message translates to:
  /// **'The password provided is too weak'**
  String get failure_invalid_password;

  /// No description provided for @failure_email_already_in_use.
  ///
  /// In en, this message translates to:
  /// **'The email address is already in use by another account'**
  String get failure_email_already_in_use;

  /// No description provided for @failure_unauthenticated.
  ///
  /// In en, this message translates to:
  /// **'User is not authenticated. Please sign in and try again.'**
  String get failure_unauthenticated;

  /// No description provided for @failure_unauthorized.
  ///
  /// In en, this message translates to:
  /// **'User is not authenticated. Please sign in and try again.'**
  String get failure_unauthorized;

  /// No description provided for @failure_unknown.
  ///
  /// In en, this message translates to:
  /// **'An unknown error occurred. Please try again later.'**
  String get failure_unknown;

  /// No description provided for @failure_permission_denied.
  ///
  /// In en, this message translates to:
  /// **'Permission denied. You do not have access to this resource.'**
  String get failure_permission_denied;

  /// No description provided for @failure_email_not_found.
  ///
  /// In en, this message translates to:
  /// **'Email not found. Please check your email and try again.'**
  String get failure_email_not_found;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @payment_failed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed , please try again'**
  String get payment_failed;

  /// No description provided for @payment_successful.
  ///
  /// In en, this message translates to:
  /// **'Payment successful'**
  String get payment_successful;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

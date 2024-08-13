// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "account_kind": MessageLookupByLibrary.simpleMessage("account_kind"),
        "customer": MessageLookupByLibrary.simpleMessage("customer"),
        "email": MessageLookupByLibrary.simpleMessage("email"),
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "name": MessageLookupByLibrary.simpleMessage("name"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "passwordConfirm":
            MessageLookupByLibrary.simpleMessage("confirm password"),
        "passwords_do_not_match":
            MessageLookupByLibrary.simpleMessage("passwords_do_not_match"),
        "phone_number_must_be_at_least_11_characters":
            MessageLookupByLibrary.simpleMessage(
                "phone_number_must_be_at_least_11_characters"),
        "please_check_your_email_for_verification":
            MessageLookupByLibrary.simpleMessage(
                "please check your email for verification"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "required_field":
            MessageLookupByLibrary.simpleMessage("required_field"),
        "trader": MessageLookupByLibrary.simpleMessage("trader"),
        "whatsapp_number":
            MessageLookupByLibrary.simpleMessage("whatsapp_number")
      };
}

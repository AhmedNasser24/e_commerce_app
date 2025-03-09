import 'package:flutter/material.dart';

import '../utils/app_style.dart';

void showSnackBar(context, message) {
  final messenger = ScaffoldMessenger.of(context);
  
  // Dismiss the currently visible SnackBar, if any
  messenger.hideCurrentSnackBar();
  messenger.showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 221, 212, 212),
      content: Text(
        message,
        style: AppStyle.regular14.copyWith(color: Colors.red),
      ),
      duration: const Duration(milliseconds: 1200),
    ),
  );
}

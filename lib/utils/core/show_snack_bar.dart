import 'package:e_commerce/utils/core/app_style.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 221, 212, 212),
      content: Text(
        message,
        style: AppStyle.regular14.copyWith(color: Colors.red),
      ),
      duration: const Duration(seconds: 6),
    ),
  );
}

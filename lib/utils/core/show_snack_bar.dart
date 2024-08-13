import 'package:e_commerce/utils/core/app_style.dart';
import 'package:flutter/material.dart';

void showSnackBar(context, message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: AppStyle.regular14,
      ),
      duration: const Duration(seconds: 6),
    ),
  );
}

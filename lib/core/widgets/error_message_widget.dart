
import 'package:e_commerce/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({
    super.key,
    required this.errMessage,
  });
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.36,
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: Text(
              errMessage,
              style: AppStyle.medium14.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
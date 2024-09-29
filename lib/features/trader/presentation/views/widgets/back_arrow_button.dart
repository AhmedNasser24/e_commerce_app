import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
    this.color,
    this.dismissAction = false,
  });
  final Color? color;
  final bool dismissAction;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (!dismissAction) {
          Navigator.pop(context);
        }
      },
      icon: Icon(Icons.arrow_back_ios, color: color ?? kPurpleColor),
    );
  }
}

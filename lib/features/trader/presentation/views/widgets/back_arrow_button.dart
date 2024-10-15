import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class BackArrowButton extends StatelessWidget {
  const BackArrowButton({
    super.key,
    this.color,
    this.dismissAction = false,
    this.onPressed,
  });
  final Color? color;
  final bool dismissAction;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: dismissAction
          ? null
          : onPressed ??
              () {
                Navigator.pop(context);
              },
      icon: Icon(Icons.arrow_back_ios, color: color ?? kPurpleColor),
    );
  }
}

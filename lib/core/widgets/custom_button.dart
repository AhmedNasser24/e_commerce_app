import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.isLoading = false,
    required this.title,
    this.onTap,
    this.style,
    this.backGroundColor,
    this.horizontalMargin = 0,
    this.verticalMargin = 0,
  });
  final bool isLoading;
  final String title;
  final void Function()? onTap;
  final TextStyle? style;
  final Color? backGroundColor;
  final double horizontalMargin, verticalMargin;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.symmetric(
            horizontal: horizontalMargin, vertical: verticalMargin),
        constraints: const BoxConstraints(minWidth: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backGroundColor ?? kPurpleColor,
        ),
        child: isLoading
            ? const SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(color: kWhiteColor ,))
            : Text(
                title,
                style: style ?? AppStyle.medium20.copyWith(color: kWhiteColor),
              ),
      ),
    );
  }
}

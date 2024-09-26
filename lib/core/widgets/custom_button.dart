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
    this.horizontalPadding = 20,
    this.verticalPadding = 10,
  });
  final bool isLoading;
  final String title;
  final void Function()? onTap;
  final TextStyle? style;
  final Color? backGroundColor;
  final double horizontalMargin, verticalMargin;
  final double horizontalPadding, verticalPadding;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
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

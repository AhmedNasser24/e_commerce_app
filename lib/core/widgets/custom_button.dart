import 'package:flutter/material.dart';

import '../../constants.dart';
import '../utils/app_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.isLoading = false,
      required this.title,
      this.onTap,
      this.style,
      this.backGroundColor});
  final bool isLoading;
  final String title;
  final void Function()? onTap;
  final TextStyle? style;
  final Color? backGroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 40),
        constraints: const BoxConstraints(minWidth: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backGroundColor ?? kPurpleColor,
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: kWhiteColor , )
            : Text(
                title,
                style: style ?? AppStyle.medium20.copyWith(color: kWhiteColor),
              ),
      ),
    );
  }
}

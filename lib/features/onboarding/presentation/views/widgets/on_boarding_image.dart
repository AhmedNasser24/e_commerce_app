import 'package:flutter/material.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage(
    this.image, {
    super.key,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: 250,
      child: Image.asset(image, fit: BoxFit.fill),
    );
  }
}

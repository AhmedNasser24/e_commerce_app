
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_images.dart';

class CustomProductImagePositioned extends StatelessWidget {
  const CustomProductImagePositioned({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -90,
      right: 0,
      left: 0,
      child: Container(
        height: 150,
        decoration: const BoxDecoration(
          // color: Colors.blue,
          image: DecorationImage(
            image: AssetImage(Assets.imagesBag),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

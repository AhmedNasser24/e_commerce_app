import 'package:flutter/material.dart';
import '../../../../../constants.dart';

class MyShoppingCartIconButton extends StatelessWidget {
  const MyShoppingCartIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.shopping_cart,
      color: kPurpleColor,
    );
  }
}

import 'package:e_commerce/features/customer/presentation/views/add_to_cart_view.dart';
import 'package:flutter/material.dart';

import 'custom_badge.dart';
import 'my_shopping_cart_icon_button.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AddToCartView.routeName,
        );
      },
      child: const CustomBadge(
        child: MyShoppingCartIconButton(),
      ),
    );
  }
}

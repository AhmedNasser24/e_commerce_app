
import 'package:flutter/material.dart';

import 'add_to_card_view_bloc_provider.dart';
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
          AddToCardViewBlocProvider.routeName,
        );
      },
      child: const CustomBadge(
        child: MyShoppingCartIconButton(),
      ),
    );
  }
}

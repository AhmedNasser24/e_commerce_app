import 'package:flutter/material.dart';
import 'add_to_card_view_bloc_provider.dart';

class MyShoppingCartIconButton extends StatelessWidget {
  const MyShoppingCartIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddToCardViewBlocProvider()));
      },
      icon: const Icon(Icons.shopping_cart),
    );
  }
}
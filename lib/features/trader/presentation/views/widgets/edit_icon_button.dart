import 'package:flutter/material.dart';

import '../edit_product_view.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditProductView(),
          ),
        );
      },
      icon: const Icon(Icons.edit, color: Colors.black),
    );
  }
}

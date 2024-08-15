
import 'package:flutter/material.dart';

import '../add_new_product_view.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.green,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNewProductView(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
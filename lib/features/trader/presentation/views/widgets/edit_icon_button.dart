
import 'package:flutter/material.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){}, icon: const Icon(Icons.edit , color:  Colors.black));
  }
}

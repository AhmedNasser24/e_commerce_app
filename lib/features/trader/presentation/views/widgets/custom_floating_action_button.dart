
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'add_new_product_view_bloc_provider.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: kPurpleColor,
      onPressed: () {
        Navigator.pushNamed(
          context,
          AddNewProductViewBlocProvider.routeName,
        );
      },
      child: const Icon(Icons.add , color: kWhiteColor,),
    );
  }
}
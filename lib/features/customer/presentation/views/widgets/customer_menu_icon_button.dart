
import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

class CustomerMenuIconButton extends StatelessWidget {
  const CustomerMenuIconButton({
    super.key, required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey ;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        scaffoldKey.currentState!.openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        color: kPurpleColor,
        size: 30,
      ),
    );
  }
}
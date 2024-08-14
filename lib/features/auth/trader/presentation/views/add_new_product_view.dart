import 'package:e_commerce/features/auth/trader/presentation/views/widgets/add_new_product_body.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class AddNewProductView extends StatelessWidget {
  const AddNewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kScaffoldColor,
      body: SafeArea(child: AddNewProductBody()),
    );
  }
}

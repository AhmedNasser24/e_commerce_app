import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';
import 'widgets/back_arrow_button.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: SizedBox()),
      appBar: AppBar(
        title: const Text("Product Details" , style : AppStyle.medium22),
        centerTitle: true,
        leading: const BackArrowButton(),
      ),
    );
  }
}
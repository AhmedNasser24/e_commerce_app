import 'package:e_commerce/features/customer/presentation/views/widgets/add_to_cart_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';
import '../../../trader/presentation/views/widgets/back_arrow_button.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : const AddToCartViewBody(),
      appBar: AppBar(
        title: Text(S.of(context).my_cart),
        centerTitle: true,
        leading: const BackArrowButton(),
      ),
    );
  }
}
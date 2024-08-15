import 'package:e_commerce/features/trader/presentation/views/widgets/add_new_product_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../generated/l10n.dart';
import 'widgets/back_arrow_button.dart';

class AddNewProductView extends StatelessWidget {
  const AddNewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body: const SafeArea(child: AddNewProductBody()),
      appBar: addNewProductAppBar(context),
    );
  }


  AppBar addNewProductAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      leading: const BackArrowButton(),
      title: Text(S.of(context).add_product),
      centerTitle: true,
    );
  }
}

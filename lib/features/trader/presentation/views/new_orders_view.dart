import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/new_orders_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../generated/l10n.dart';

class NewOrdersView extends StatelessWidget {
  const NewOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kScaffoldColor,
      body : const SafeArea(child: NewOrdersViewBody()),
      appBar: AppBar(
        title: Text (S.of(context).new_orders),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const BackArrowButton(),
      ),
    );
  }
}
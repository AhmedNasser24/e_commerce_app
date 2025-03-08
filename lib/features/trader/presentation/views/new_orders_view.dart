import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/new_orders_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/app_style.dart';

class NewOrdersView extends StatelessWidget {
  const NewOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body: const SafeArea(child: NewOrdersViewBody()),
      appBar: AppBar(
        title: Text(LocaleKeys.new_orders.tr(), style: AppStyle.medium22),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const BackArrowButton(),
        backgroundColor: kWhiteColor,
      ),
    );
  }
}

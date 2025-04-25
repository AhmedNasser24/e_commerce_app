import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/new_orders_view_body.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';


import '../../../../core/utils/app_style.dart';

class NewOrdersView extends StatelessWidget {
  const NewOrdersView({super.key});
  static const String routeName = '/newOrdersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body: const SafeArea(child: NewOrdersViewBody()),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.new_orders, style: AppStyle.medium22),
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: const BackArrowButton(),
        backgroundColor: kWhiteColor,
      ),
    );
  }
}

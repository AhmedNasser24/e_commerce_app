import 'package:e_commerce/features/customer/presentation/views/widgets/customer_app_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/customer_drawer.dart';
import 'widgets/customer_home_body.dart';

class CustomerHomeView extends StatefulWidget {
  const CustomerHomeView({super.key, required this.changeLanguage});
  final void Function(Locale newLocale) changeLanguage;

  @override
  State<CustomerHomeView> createState() => _CustomerHomeViewState();
}

class _CustomerHomeViewState extends State<CustomerHomeView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: scaffoldKey,
      body: const CustomerHomeBody(),
      drawer: CustomerDrawer(changeLanguage: widget.changeLanguage),
      appBar: customerAppBar(context, scaffoldKey),
    );
  }
}
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowOrdersView extends StatelessWidget {
  const ShowOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: SizedBox()),
      appBar: AppBar(
        leading: const BackArrowButton(),
        title: const Text("Customer Name"),
        centerTitle: true,
        actions: const [
           WhatsAppIconButton()
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}

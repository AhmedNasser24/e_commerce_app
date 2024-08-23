import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/show_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'widgets/whats_app_icon_button.dart';

class ShowOrdersView extends StatelessWidget {
  const ShowOrdersView({
    super.key,
    required this.buyProdcutModel,
  });
  final BuyProductModel buyProdcutModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ShowOrdersViewBody(
              productItemModelList: buyProdcutModel.productItemModelList)),
      appBar: AppBar(
        leading: const BackArrowButton(),
        title: const Text("Customer Name"),
        centerTitle: true,
        actions: [
          WhatsAppIconButton(
            whatsappNumber: buyProdcutModel.userInfoModel.whatsappNumber!,
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }
}

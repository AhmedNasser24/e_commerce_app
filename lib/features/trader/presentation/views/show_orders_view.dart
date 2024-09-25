import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/show_orders_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/app_style.dart';
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
      backgroundColor: kOffWhiteColor,
      body: SafeArea(
          child: ShowOrdersViewBody(
              productItemModelList: buyProdcutModel.productItemModelList)),
      appBar: AppBar(
        leading: const BackArrowButton(),
        title:  Text(buyProdcutModel.userInfoModel.name!, style: AppStyle.medium22),
        centerTitle: true,
        actions: [
          WhatsAppIconButton(
            whatsappNumber: buyProdcutModel.userInfoModel.whatsappNumber!,
          ),
        ],
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: kWhiteColor,
      ),
    );
  }
}

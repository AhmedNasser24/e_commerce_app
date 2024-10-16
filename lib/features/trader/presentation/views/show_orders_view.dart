import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/is_delivered_widget.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/show_orders_view_body.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/product_item_model.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../generated/l10n.dart';
import 'widgets/whats_app_icon_button.dart';

class ShowOrdersView extends StatelessWidget {
  const ShowOrdersView({
    super.key,
    required this.buyProductModel,
  });
  final BuyProductModel buyProductModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body: SafeArea(
          child: ShowOrdersViewBody(
              productItemModelList: buyProductModel.productItemModelList)),
      appBar: showOrdersViewAppBar(),
      bottomNavigationBar: custombottomAppBar(context),
    );
  }

  BottomAppBar custombottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: kPurpleColor,
      elevation: 0,
      child: Row(
        children: [
          Text(
              "${__getTotalPrice(buyProductModel.productItemModelList)} ${S.of(context).LE}",
              style: AppStyle.semiBold18.copyWith(color: kWhiteColor)),
          const Spacer(),
          IsDeliveredWidget(buyProductModel: buyProductModel),
        ],
      ),
    );
  }

  AppBar showOrdersViewAppBar() {
    return AppBar(
      leading: const BackArrowButton(),
      title: Text(
        buyProductModel.userInfoModel.name!,
        style: AppStyle.medium22,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      actions: [
        WhatsAppIconButton(
          whatsappNumber: buyProductModel.userInfoModel.whatsappNumber!,
        ),
      ],
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kWhiteColor,
    );
  }

  double __getTotalPrice(List<ProductItemModel> productItemModelList) {
    double totalPrice = 0.0;
    for (var productItemModel in productItemModelList) {
      totalPrice += double.parse(productItemModel.price!);
    }
    return totalPrice;
  }
}

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/functions/change_num_to_arabic.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/back_arrow_button.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/is_delivered_widget.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/show_orders_view_body.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../core/models/product_item_model.dart';
import '../../../../core/utils/app_style.dart';

import 'widgets/whats_app_icon_button.dart';

class ShowOrdersView extends StatelessWidget {
  const ShowOrdersView({
    super.key,
    required this.buyProductModel,
  });
  final BuyProductModel buyProductModel;
  static const String routeName = '/showOrdersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body: SafeArea(
          child: ShowOrdersViewBody(
              buyProductModel: buyProductModel)),
      appBar: showOrdersViewAppBar(context),
      bottomNavigationBar: custombottomAppBar(context),
    );
  }

  BottomAppBar custombottomAppBar(BuildContext context) {
    return BottomAppBar(
      color: kPurpleColor,
      elevation: 0,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "${changePriceLanguage(__getTotalPrice(buyProductModel.productItemModelList),context)} ${AppLocalizations.of(context)!.le}",
              style: AppStyle.semiBold18.copyWith(color: kWhiteColor),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 1,
            child: IsDeliveredWidget(buyProductModel: buyProductModel),
          ),
        ],
      ),
    );
  }

  AppBar showOrdersViewAppBar(BuildContext context) {
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

  String __getTotalPrice(List<ProductItemModel> productItemModelList) {
    double totalPrice = 0.0;
    for (var productItemModel in productItemModelList) {
      totalPrice += double.parse(productItemModel.price!);
    }
    return totalPrice.toString();
  }
}

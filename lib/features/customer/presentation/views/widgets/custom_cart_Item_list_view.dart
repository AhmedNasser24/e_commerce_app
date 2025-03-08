import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/widgets/message_widget.dart';
import '../../../../../generated/locale_keys.g.dart';
import '../../../data/models/cart_item_model.dart';
import 'cart_item.dart';
import 'buy_product_bottom_app_bar.dart';

class CustomCartItemListView extends StatelessWidget {
  const CustomCartItemListView({
    super.key,
    required this.cartItemModelList,
  });
  final List<CartItemModel> cartItemModelList;
  @override
  Widget build(BuildContext context) {
    return cartItemModelList.isEmpty
        ? MessageWidget(LocaleKeys.empty.tr())
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItemModelList.length,
                  itemBuilder: (context, i) {
                    return CartItem(
                      cartItemModel: cartItemModelList[i],
                    );
                  },
                ),
              ),
              cartItemModelList.isEmpty
                  ? const Gap(0)
                  : BuyProductBottomAppBar(
                      cartItemModelList: cartItemModelList),
            ],
          );
  }
}

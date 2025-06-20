import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../core/widgets/message_widget.dart';
import '../../../data/models/cart_item_model.dart';
import 'cart_item.dart';
import 'buy_product_bottom_app_bar.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

class CustomCartItemListView extends StatelessWidget {
  const CustomCartItemListView({
    super.key,
    required this.cartItemModelList,
    required this.crossAxisCount,
  });
  final List<CartItemModel> cartItemModelList;
  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    return cartItemModelList.isEmpty
        ? MessageWidget(AppLocalizations.of(context)!.empty)
        : Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 1,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 12,
                  ),
                  // physics: AlwaysScrollableScrollPhysics(),
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

import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/core/utils/app_style.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/orders_item.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class ShowOrdersGridView extends StatelessWidget {
  const ShowOrdersGridView({
    super.key,
    required this.buyProductModel,
    required this.crossAxisCount,
  });

  final BuyProductModel buyProductModel;

  final int crossAxisCount;
  @override
  Widget build(BuildContext context) {
    bool isPaid = buyProductModel.isPaid;
    List<ProductItemModel> productItemModelList = buyProductModel.productItemModelList;
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Text(
              isPaid ? AppLocalizations.of(context)!.paid : AppLocalizations.of(context)!.not_paid,
              style: AppStyle.semiBold18.copyWith(
                color: isPaid ? Colors.green : Colors.red,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: 0.62,
                crossAxisSpacing: 15,
                mainAxisSpacing: 12,
              ),
              itemCount: productItemModelList.length,
              itemBuilder: (context, i) =>
                  OrderItem(productItemModel: productItemModelList[i]),
            ),
          ),
        ),
      ],
    );
  }
}

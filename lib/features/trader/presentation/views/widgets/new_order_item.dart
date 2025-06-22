import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/functions/change_num_to_arabic.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../l10n/app_localizations.dart';

class NewOrderItem extends StatelessWidget {
  const NewOrderItem({
    super.key,
    this.onTap,
    required this.buyProductModel,
  });
  final void Function()? onTap;
  final BuyProductModel buyProductModel;
  @override
  Widget build(BuildContext context) {
    String customerName = buyProductModel.userInfoModel.name!;
    int numOfProducts = buyProductModel.productItemModelList.length;
    String totalPrice = __getTotalPrice(buyProductModel.productItemModelList);
    bool isNew = buyProductModel.isNew;
    bool isPaid = buyProductModel.isPaid;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              width: double.infinity,
              child: GestureDetector(
                onTap: onTap,
                child: Card(
                  color: kWhiteColor,
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          customerName,
                          style: isNew
                              ? AppStyle.semiBold16
                                  .copyWith(color: Colors.green)
                              : AppStyle.semiBold16,
                        ),
                        const Gap(10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                "${AppLocalizations.of(context)!.num_of_products} : ${changeNumLanguage(numOfProducts.toString(), context)}", // num of product not price but function name is changePriceLanguage
                                style: isNew
                                    ? AppStyle.medium16
                                        .copyWith(color: Colors.green)
                                    : AppStyle.semiBold16),
                            isNew ? const Spacer() : const SizedBox(),
                            isNew
                                ? Text(
                                    AppLocalizations.of(context)!.news,
                                    style: AppStyle.medium16
                                        .copyWith(color: Colors.green),
                                  )
                                : const SizedBox()
                          ],
                        ),
                        const Gap(10),
                        Text(
                            "${AppLocalizations.of(context)!.total_price} : ${changePriceLanguage(totalPrice, context)} ${AppLocalizations.of(context)!.le}",
                            style: isNew
                                ? AppStyle.semiBold16
                                    .copyWith(color: Colors.green)
                                : AppStyle.semiBold16),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          isPaid
              ? Positioned(
                  top: 22,
                  right: -2,
                  child: Transform.rotate(
                    angle: 45 * 3.14 / 180 ,
                    child: Container(
                      decoration: BoxDecoration(
                        color: isNew ? Colors.red : Colors.green,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 2),
                      child: Text(
                        AppLocalizations.of(context)!.paid,
                        style: AppStyle.regular10.copyWith(
                          color: isNew ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
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

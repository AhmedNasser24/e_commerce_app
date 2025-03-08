import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/customer/data/models/buy_product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color:  kWhiteColor,
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  customerName,
                  style: isNew
                      ? AppStyle.semiBold16.copyWith(color: Colors.green)
                      : AppStyle.semiBold16,
                ),
                const Gap(10),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${LocaleKeys.num_of_products.tr()} : $numOfProducts",
                        style: isNew
                            ? AppStyle.medium16.copyWith(color: Colors.green)
                            : AppStyle.semiBold16),
                    isNew ? const Spacer() : const SizedBox(),
                    isNew
                        ? Text(
                            LocaleKeys.news.tr(),
                            style:
                                AppStyle.medium16.copyWith(color: Colors.green),
                          )
                        : const SizedBox()
                  ],
                ),
                const Gap(10),
                Text(
                    "${LocaleKeys.total_price.tr()} : $totalPrice ${LocaleKeys.LE.tr()}",
                    style: isNew
                        ? AppStyle.semiBold16.copyWith(color: Colors.green)
                        : AppStyle.semiBold16),
              ],
            ),
          ),
        ),
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

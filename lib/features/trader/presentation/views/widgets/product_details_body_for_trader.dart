import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/product_image_details.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/utils/app_style.dart';

class ProductDetailsViewBodyForTrader extends StatelessWidget {
  const ProductDetailsViewBodyForTrader ({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImageDetails(productItemModel: productItemModel),
          const Gap(30),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productItemModel.name!, style: AppStyle.medium18),
                const Gap(20),
                 Text(
                  productItemModel.desc ?? "",
                  style: AppStyle.semiBold16,
                  textAlign: TextAlign.start,
                ),
                const Gap(60),
              ],
            ),
          )
        ],
      ),
    );
  }
}



import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../generated/l10n.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                decoration: const BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Text(
                  '-50%',
                  style: AppStyle.medium12.copyWith(color: kWhiteColor),
                ),
              ),
              // const Spacer(),
              // const Icon(
              //   CupertinoIcons.heart,
              //   color: kPurpleColor,
              //   size: 24,
              // ),
            ],
          ),
          SizedBox(
              height: 120,
              width: double.infinity,
              child: CustomCachedNetworkImage(
                  imageUrl: productItemModel.imageUrl!)),
          Text(
            productItemModel.name!,
            style: AppStyle.bold18,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(15),
          Text(
            productItemModel.category!,
            style: AppStyle.medium14,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(15),
          Row(
            children: [
              Text("${productItemModel.price!}${S.of(context).LE}",
                  style: AppStyle.bold14),
              // const Spacer(),
              // const Text("quantity : 2", style: AppStyle.bold14),
            ],
          )
        ],
      ),
    );
  }
}

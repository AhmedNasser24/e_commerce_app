import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/product_item_model.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class OrderItemDetails extends StatelessWidget {
  const OrderItemDetails({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(60),
        Text(
          productItemModel.name!,
          style: AppStyle.medium16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Text(
          productItemModel.category!,
          style: AppStyle.medium16.copyWith(color: Colors.grey),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Text(
          "${productItemModel.price} ${LocaleKeys.LE.tr()}",
          style: AppStyle.semiBold16,
        ),
      ],
    );
  }
}

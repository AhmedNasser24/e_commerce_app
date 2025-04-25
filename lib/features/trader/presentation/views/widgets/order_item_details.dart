import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/product_item_model.dart';
import '../../../../../core/utils/app_style.dart';

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
          "${productItemModel.price} ${AppLocalizations.of(context)!.le}", // Fixed the usage of .tr() method
          style: AppStyle.semiBold16,
        ),
      ],
    );
  }
}

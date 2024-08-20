import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../../core/models/product_item_model.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../generated/l10n.dart';
import 'edit_icon_button.dart';

class TraderProductDetails extends StatelessWidget {
  const TraderProductDetails({
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
        Row(
          children: [
            Text(
              "${productItemModel.price} ${S.of(context).LE}",
              style: AppStyle.semiBold16,
            ),
            const Spacer(),
            EditIconButton(productItemModel: productItemModel)
          ],
        ),
      ],
    );
  }
}

import 'package:e_commerce/core/functions/change_num_to_arabic.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/remove_item_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../data/models/cart_item_model.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({
    super.key,
    required this.cartItemModel,
  });
  final CartItemModel cartItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(60),
        Text(
          cartItemModel.productItemModel.name!,
          style: AppStyle.medium16,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Text(
          cartItemModel.productItemModel.category!,
          style: AppStyle.medium16.copyWith(color: Colors.grey),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        const Gap(6),
        Row(
          children: [
            Text(
              "${changePriceLanguage(cartItemModel.productItemModel.price!,context)} ${AppLocalizations.of(context)!.le}",
              style: AppStyle.semiBold16,
            ),
            const Spacer(),
            RemoveItemCartButton(cartItemModel: cartItemModel),
          ],
        ),
      ],
    );
  }
}

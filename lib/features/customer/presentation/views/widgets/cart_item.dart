import 'package:e_commerce/core/functions/change_num_to_arabic.dart';
import 'package:e_commerce/features/customer/presentation/views/widgets/remove_item_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../data/models/cart_item_model.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemModel});
  final CartItemModel cartItemModel;

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
                  '-${changeNumLanguage(cartItemModel.productItemModel.discount!, context)}%',
                  style: AppStyle.medium12.copyWith(color: kWhiteColor),
                ),
              ),
            ],
          ),
          SizedBox(
              height: 120,
              width: double.infinity,
              child: CustomCachedNetworkImage(
                  imageUrl: cartItemModel.productItemModel.imageUrl!)),
          Text(
            cartItemModel.productItemModel.name!,
            style: AppStyle.bold18,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(15),
          Text(
            cartItemModel.productItemModel.category!,
            style: AppStyle.medium14,
            overflow: TextOverflow.ellipsis,
          ),
          const Gap(15),
          Row(
            children: [
              Text(
                "${changePriceLanguage(cartItemModel.productItemModel.price!,context)} ${AppLocalizations.of(context)!.le}",
                style: AppStyle.bold16,
              ),
              const Spacer(),
              RemoveItemCartButton(cartItemModel: cartItemModel)
            ],
          )
        ],
      ),
    );
  }
}

import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/product_image_item.dart';
import 'delete_icon_button.dart';
import 'edit_icon_button.dart';
import 'package:e_commerce/l10n/app_localizations.dart';

class TraderProductItem extends StatelessWidget {
  const TraderProductItem({super.key, required this.productItemModel});
  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
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
              const Spacer(),
              DeleteIconButton(productItemModel: productItemModel),
            ],
          ),
          ProductImageItem(imageUrl: productItemModel.imageUrl!),
          Text(
            productItemModel.name!,
            style: AppStyle.bold18,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            productItemModel.category!,
            style: AppStyle.medium14,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            children: [
              Text("${productItemModel.price!} ${AppLocalizations.of(context)!.le}",
                  style: AppStyle.bold14),
              const Spacer(),
              EditIconButton(productItemModel: productItemModel),
            ],
          )
        ],
      ),
    );
  }
}


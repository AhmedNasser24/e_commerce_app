import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../core/widgets/product_image_positioned.dart';
import '../../../../../generated/l10n.dart';
import 'edit_icon_button.dart';
import 'trader_product_details.dart';

// class TraderProductItem extends StatelessWidget {
//   const TraderProductItem({super.key, required this.productItemModel});
//   final ProductItemModel productItemModel;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 8, left: 8, top: 120),
//       child: Stack(
//         clipBehavior: Clip.none,
//         children: [
//           Card(
//             color: Colors.white,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
              // child: TraderProductDetails(productItemModel: productItemModel),
//             ),
//           ),
// CustomProductImagePositioned(imageUrl: productItemModel.imageUrl!),
//         ],
//       ),
//     );
//   }
// }

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
              // const Spacer(),
              // const Icon(
              //   CupertinoIcons.heart,
              //   color: kPurpleColor,
              //   size: 24,
              // ),
            ],
          ),
          SizedBox(
              height: 90,
              width: double.infinity,
              child: CustomCachedNetworkImage(
                  imageUrl: productItemModel.imageUrl!)),
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
              Text("${productItemModel.price!}${S.of(context).LE}",
                  style: AppStyle.bold14),
              const Spacer(),
              EditIconButton(productItemModel: productItemModel),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(
              //     Icons.shopping_cart_checkout,
              //     color: kPurpleColor,
              //   ),
              // )
            ],
          )
        ],
      ),
    );
  }
}

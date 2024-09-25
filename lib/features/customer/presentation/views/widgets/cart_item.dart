import 'package:e_commerce/features/customer/presentation/views/widgets/remove_item_cart_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/cart_item_model.dart';
import 'cart_item_details.dart';

// class CartItem extends StatelessWidget {
//   const CartItem({super.key, required this.cartItemModel});
//   final CartItemModel cartItemModel;
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
//               child: CartItemDetails(cartItemModel: cartItemModel),
//             ),
//           ),
//           CustomProductImagePositioned(imageUrl:cartItemModel.productItemModel.imageUrl!),
//         ],
//       ),
//     );
//   }
// }


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
                  '-50%',
                  style: AppStyle.medium12.copyWith(color: kWhiteColor),
                ),
              ),
              
            ],
          ),
          SizedBox(
              height: 120,
              width: double.infinity,
              child: CustomCachedNetworkImage(
                  imageUrl:cartItemModel.productItemModel.imageUrl!)),
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
              Text("${cartItemModel.productItemModel.price!}${S.of(context).LE}",
                  style: AppStyle.bold16),
              const Spacer(),
              RemoveItemCartButton(cartItemModel: cartItemModel)
            ],
          )
        ],
      ),
    );
  }
}


import 'package:e_commerce/constants.dart';
import 'package:e_commerce/features/customer/data/models/my_order_item_model.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';

class MyOrderItem extends StatelessWidget {
  const MyOrderItem({super.key, required this.myOrderItemModel});
  final MyOrderItemModel myOrderItemModel ;
  @override
  Widget build(BuildContext context) {
    String productName = myOrderItemModel.cartItemModel.productItemModel.name!;
    String productPrice = myOrderItemModel.cartItemModel.productItemModel.price!;
    String productImage = myOrderItemModel.cartItemModel.productItemModel.imageUrl!;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        tileColor: kWhiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Radio(
          activeColor: kPurpleColor,
          value: '0', groupValue: "0", onChanged: (value){}),
        title: Text(productName, style: AppStyle.medium16),
        subtitle: Text("$productPrice ${AppLocalizations.of(context)!.le}", style: AppStyle.semiBold16),
        trailing: SizedBox(
          height: 60,
          width:60,
          child : CustomCachedNetworkImage(imageUrl: productImage ),
        )

      ),
    );
  }
}
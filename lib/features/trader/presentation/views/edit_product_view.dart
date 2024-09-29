import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';
import '../../../../generated/l10n.dart';
import '../../../../core/models/product_item_model.dart';
import 'widgets/back_arrow_button.dart';
import 'widgets/edit_product_body.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key, required this.productItemModel});
  
  final ProductItemModel productItemModel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body:
          SafeArea(child: EditProductBody(productItemModel: productItemModel)),
      appBar: editProductAppBar(context),
    );
  }

  AppBar editProductAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kPurpleColor,
      leading: const BackArrowButton(color: kWhiteColor),
      title: Text(S.of(context).edit_product , style: AppStyle.medium22.copyWith(color:kWhiteColor)),
      centerTitle: true,
    );
  }
}

import 'package:e_commerce/features/customer/presentation/views/widgets/add_to_cart_view_body.dart';
import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../generated/l10n.dart';
import '../../../trader/presentation/views/widgets/back_arrow_button.dart';

class AddToCartView extends StatelessWidget {
  const AddToCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : const AddToCartViewBody(),
      appBar: AppBar(
        title: Text(S.of(context).my_cart , style : AppStyle.medium22),
        centerTitle: true,
        leading: const BackArrowButton(),
        elevation: 0,
        scrolledUnderElevation: 0 ,
        backgroundColor: kWhiteColor,
      ),
    );
  }
}
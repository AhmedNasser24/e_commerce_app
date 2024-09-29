import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        __showConfirmAwesomeDialog(context);
      },
      icon: const Icon(
        Icons.delete,
        color: kPurpleColor,
      ),
    );
  }

  void __showConfirmAwesomeDialog(context) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: S.of(context).are_you_sure_you_want_to_delete_this_product,
      btnOkText: S.of(context).yes,
      btnCancelText: S.of(context).cancel,
      btnOkOnPress: () {
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .deleteProduct(productItemModel: productItemModel);
      },
      btnCancelOnPress: () {} ,
    ).show();
  }
}
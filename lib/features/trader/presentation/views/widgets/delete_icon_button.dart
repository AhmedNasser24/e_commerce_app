import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/models/product_item_model.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import '../../manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';

class DeleteIconButton extends StatelessWidget {
  const DeleteIconButton({
    super.key,
    required this.productItemModel, required this.index,
  });
  final ProductItemModel productItemModel;
  final int index ;
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
      width: kMaxWidthForDialog,
      context: context,
      dialogType: DialogType.question,
      animType: AnimType.topSlide,
      desc: AppLocalizations.of(context)!.are_you_sure_you_want_to_delete_this_product,
      btnOkText: AppLocalizations.of(context)!.yes,
      btnCancelText: AppLocalizations.of(context)!.cancel,
      btnOkOnPress: () {
        BlocProvider.of<FetchCategoryProductsForTraderCubit>(context)
            .deleteProduct(productItemModel: productItemModel , index: index);
      },
      btnCancelOnPress: () {} ,
    ).show();
  }
}
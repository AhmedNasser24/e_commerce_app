import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:e_commerce/core/models/product_item_model.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_style.dart';
import '../../../../../core/widgets/custom_cached_network_image.dart';
import '../../../../../generated/l10n.dart';
import 'edit_icon_button.dart';

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
              Text("${productItemModel.price!} ${S.of(context).LE}",
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

import 'package:e_commerce/constants.dart';
import 'package:flutter/material.dart';
import '../../../../../core/models/product_item_model.dart';
import 'edit_product_view_bloc_provider.dart';

class EditIconButton extends StatelessWidget {
  const EditIconButton({
    super.key,
    required this.productItemModel,
  });
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(
          context,
          EditProductViewBlocProvider.routeName,
          arguments: productItemModel,
        );
      },
      icon: const Icon(Icons.edit, color: kPurpleColor),
    );
  }
}

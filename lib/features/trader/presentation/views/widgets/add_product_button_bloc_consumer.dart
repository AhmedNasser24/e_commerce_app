import 'dart:math';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({
    super.key,
    required this.formKey,
    required this.productItemModel, required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  final bool isLoading ;
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      title: S.of(context).add_product,
      isLoading: isLoading,
      horizontalMargin: 50,
      onTap: () {
        if (formKey.currentState!.validate()) {
          setProductIdAndTraderIdAndDate();
          BlocProvider.of<AddProductCubit>(context)
              .addProduct(productItemModel: productItemModel);
        } else {
          formKey.currentState!.save();
        }
      },
    );
  }

  void setProductIdAndTraderIdAndDate() {
    productItemModel.createAt = DateTime.now().toString();
    productItemModel.productId = Random().nextDouble().toString();
    productItemModel.traderId = FirebaseAuth.instance.currentUser!.uid;
  }
}

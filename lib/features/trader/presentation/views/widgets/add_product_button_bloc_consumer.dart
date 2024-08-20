import 'dart:math';

import 'dart:developer' as dv;

import 'package:e_commerce/core/functions/show_snack_bar.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';
import '../../manager/add_product_cubit/add_product_cubit.dart';

class AddProductButtonBlocConsumer extends StatelessWidget {
  const AddProductButtonBlocConsumer({
    super.key,
    required this.formKey,
    required this.productItemModel,
  });
  

  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductLoading) {
          isLoading = true;
          dv.log("$isLoading") ;
        } else if (state is AddProductSuccess) {
          isLoading = false;
          showSnackBar(context , S.of(context).product_is_added_successfully);
        } else if (state is AddProductFailure) {
          showSnackBar(context, state.errMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return CustomButton(
          title: S.of(context).add_product,
          isLoading: isLoading,
          onTap: ()  {
            if (formKey.currentState!.validate()) {
              setProductIdAndTraderIdAndDate();
               BlocProvider.of<AddProductCubit>(context)
                  .addProduct(productItemModel: productItemModel);
            } else {
              formKey.currentState!.save();
            }
          },
        );
      },
    );
  }

  void setProductIdAndTraderIdAndDate() {
    productItemModel.dateOfBuying = DateTime.now().toString();
    productItemModel.productId = Random().nextDouble().toString();
    productItemModel.traderId = FirebaseAuth.instance.currentUser!.uid;
  }
}

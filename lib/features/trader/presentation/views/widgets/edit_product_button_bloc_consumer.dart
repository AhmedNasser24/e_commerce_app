import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/trader/presentation/manager/edit_product_cubit/edit_product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/models/product_item_model.dart';

class EditProductButtonBlocConsumer extends StatelessWidget {
  const EditProductButtonBlocConsumer(
      {super.key, required this.formKey, required this.productItemModel});
  final GlobalKey<FormState> formKey;
  final ProductItemModel productItemModel;
  @override
  Widget build(BuildContext context) {
    bool isLoading = false ;
    return BlocConsumer<EditProductCubit, EditProductState>(
      listener: (context, state) {
        if (state is EditProductFailure) {
          isLoading = false ;
          showSnackBar(context, state.errMessage);
        } else if (state is EditProductSuccess) {
          isLoading = false ;
          Navigator.pop(context);
        }else if (state is EditProductLoading) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return CustomButton(
          isLoading: isLoading,
          title: S.of(context).edit_product,
          onTap: () async {
            if (formKey.currentState!.validate()) {
              await BlocProvider.of<EditProductCubit>(context)
                  .editProduct(productItemModel: productItemModel);
            } else {
              formKey.currentState!.save();
            }
          },
        );
      },
    );
  }
}

import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/models/product_item_model.dart';
import '../../../data/repo/trader_repo.dart';
import '../../manager/edit_product_cubit/edit_product_cubit.dart';
import '../edit_product_view.dart';

class EditProductViewBlocProvider extends StatelessWidget {
  const EditProductViewBlocProvider({
    super.key,
    required this.productItemModel,
  });

  final ProductItemModel productItemModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProductCubit(getIt<TraderRepo>()),
      child: EditProductView(productItemModel: productItemModel),
    );
  }
}

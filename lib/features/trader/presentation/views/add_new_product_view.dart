import 'package:e_commerce/features/trader/presentation/manager/add_product_cubit/add_product_cubit.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/add_new_product_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_style.dart';
import '../../../../generated/l10n.dart';
import 'widgets/back_arrow_button.dart';

class AddNewProductView extends StatelessWidget {
  const AddNewProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhiteColor,
      body: SafeArea(
        child: BlocProvider(
          create: (context) => AddProductCubit(),
          child: const AddNewProductBody(),
        ),
      ),
      appBar: addNewProductAppBar(context),
    );
  }

  AppBar addNewProductAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: kWhiteColor,
      leading: const BackArrowButton(),
      title: Text(S.of(context).add_product, style: AppStyle.medium22),
      centerTitle: true,
    );
  }
}

import 'package:e_commerce/features/trader/presentation/views/widgets/custom_refresh_indicator_for_trader.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/responsive_product_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../../../auth/presentation/manager/sign_out_cubit/sign_out_cubit.dart';

class TraderHomeViewBody extends StatelessWidget {
  const TraderHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocConsumer<SignOutCubit, SignOutState>(
      listener: (context, state) {
        if (state is SignOutLoading) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const CustomRefreshIndicatorForTrader(
            child: ResponsiveProductItemListView(),
          ),
        );
      },
    );
  }
}

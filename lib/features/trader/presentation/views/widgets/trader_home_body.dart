import 'package:e_commerce/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'trader_product_card_listview.dart';

class TraderHomeViewBody extends StatelessWidget {
  const TraderHomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false ;
    return  BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignOutLoading){
          isLoading = true ;
        }else {
          isLoading = false ;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          child: const TraderProductCardListView());
      },
    );
  }
}

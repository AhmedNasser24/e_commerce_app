import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:e_commerce/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../data/repos/auth_repo.dart';
import 'widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: kOffWhiteColor,
        body: SafeArea(child: RegisterBody()),
      ),
    );
  }
}

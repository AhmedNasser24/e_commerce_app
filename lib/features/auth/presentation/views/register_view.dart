import 'package:e_commerce/core/utils/get_it_setup.dart';
import 'package:e_commerce/features/auth/presentation/manager/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants.dart';
import '../../data/repos/auth_repo.dart';
import 'widgets/register_body.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  static const String routeName = "/registerView";

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

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

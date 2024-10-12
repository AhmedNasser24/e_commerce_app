import 'package:e_commerce/local_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/app_style.dart';
import '../../../../generated/l10n.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(S.of(context).are_you_sure_you_want_to_delete_this_product,
                style: AppStyle.bold28),
            const Gap(40),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LocalCubit>(context)
                      .changeLanguage(const Locale('en'));
                },
                child: Text(S.of(context).english)),
            const Gap(40),

            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LocalCubit>(context)
                      .changeLanguage(const Locale('ar'));
                },
                child: Text(S.of(context).arabic)),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}

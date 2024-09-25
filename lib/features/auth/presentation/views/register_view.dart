import 'package:flutter/material.dart';

import '../../../../constants.dart';
import 'widgets/register_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView ({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kOffWhiteColor,
      body: SafeArea(child: RegisterBody()),
    );
  }
}
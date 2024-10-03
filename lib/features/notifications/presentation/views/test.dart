import 'package:flutter/material.dart';

import '../../../../core/utils/app_style.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child : Text("test" , style: AppStyle.bold28),
      ),
    );
  }
}
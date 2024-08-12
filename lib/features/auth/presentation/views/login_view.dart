import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../utils/core/img_picker.dart';
import 'widgets/login_body.dart';

class LoginView extends StatelessWidget {
  const LoginView ({super.key});
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  LoginBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? path = await imgPicker();
          log(path ?? 'null');
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
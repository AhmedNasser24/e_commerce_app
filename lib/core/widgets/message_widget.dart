import 'package:flutter/material.dart';

import '../utils/app_style.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.message, {super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.36,
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              message,
              style: AppStyle.medium16,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        
      ],
    );
  }
}

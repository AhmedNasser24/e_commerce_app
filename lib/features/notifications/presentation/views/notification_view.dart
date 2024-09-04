import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child : Text("welcome") ,
      ),
      appBar: AppBar(
        title : const Text("Notifications") ,
        centerTitle: true,
      ),
    );
  }
}

import 'package:e_commerce/core/services/notification_service.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce/main.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class CustomMaterialApp extends StatefulWidget {
  const CustomMaterialApp({
    super.key,
  });

  @override
  State<CustomMaterialApp> createState() => _CustomMaterialAppState();
}

class _CustomMaterialAppState extends State<CustomMaterialApp> {
  @override
  void initState() {
    NotificationService()
        .setupInteractedMessageForBackgroundNotification(context);
    NotificationService().setupInteractedMessageForTerminatedState(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashView(),
        );
      
  }
}

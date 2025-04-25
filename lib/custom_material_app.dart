import 'package:e_commerce/core/manager/locale_cubit/locale_cubit.dart';
import 'package:e_commerce/core/services/notification_service.dart';
import 'package:e_commerce/core/utils/on_generate_route.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce/l10n/app_localizations.dart';
import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<LocaleCubit, LocaleState>(
      builder: (context, state) {
        return MaterialApp(
          locale: BlocProvider.of<LocaleCubit>(context).currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: onGenerateRoute,
          initialRoute: SplashView.routeName,
        );
      },
    );
  }
}

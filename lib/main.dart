import 'dart:developer';
import 'package:e_commerce/core/utils/notification_service.dart';
import 'package:e_commerce/features/auth/presentation/views/register_view.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'features/auth/presentation/views/login_view.dart';
// import 'features/notifications/presentation/views/notification_view.dart';
import 'features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'features/notifications/presentation/views/notification_view.dart';
import 'features/notifications/presentation/views/test.dart';
import 'features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'features/trader/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'local_cubit.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("BackgroundHandler succeed");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = SimpleBlocObserver();
  // NotificationService().requestPermission();
  // await NotificationService().getToken();
  // await NotificationService().getAccessToken();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://e145213b4918b2b73940f2ca2dba97ff@o4508040243249152.ingest.us.sentry.io/4508040253079552';

        options.tracesSampleRate = 0.01 ;
      },
      appRunner: () => runApp(const MyApp()),
    );
  } else {
    runApp(const MyApp());
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    NotificationService().foregroundNotificationHandling();
    
    //--------------------------------------------------------------------------------------
    // those functions are in login view initstate because of context issue of navigation
    // NotificationService().setupInteractedMessageForBackgroundNotification(context);
    // NotificationService().setupInteractedMessageForTerminatedState(context);
    //--------------------------------------------------------------------------------------
    super.initState();
  }

  // Locale _locale = const Locale('en');
  // void changeLanguage(Locale newLocale) {
  //   setState(() {
  //     _locale = newLocale;
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => FetchCategoryProductsForTraderCubit(),
        ),
        BlocProvider(
          create: (context) => FetchNewOrdersCubit(),
        ),
        BlocProvider(
          create: (context) => ImagePickerCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child:const CustomMaterialApp() ,
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalCubit, Locale>(
      builder: (context, state) {
        return MaterialApp(
            locale: state,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: 
            // const NotificationView()
            const TestView(),
                //  LoginView()
                 // isLogin ? const RegisterView() : const LoginView(),
          );
      },
    );
  }
}

import 'dart:developer';
import 'package:e_commerce/core/manager/locale_cubit/locale_cubit.dart';
import 'package:e_commerce/core/services/notification_service.dart';
import 'package:e_commerce/custom_material_app.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'core/utils/shared_preference_singleton.dart';
// import 'features/notifications/presentation/views/notification_view.dart';
import 'features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'features/trader/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'generated/codegen_loader.g.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
  SharedPreferenceSingleton.init();
  await EasyLocalization.ensureInitialized();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://e145213b4918b2b73940f2ca2dba97ff@o4508040243249152.ingest.us.sentry.io/4508040253079552';

        options.tracesSampleRate = 0.01;
      },
      appRunner: () => runApp(
        EasyLocalization(
            supportedLocales: [Locale('en'), Locale('ar')],
            path:
                'assets/translations', // <-- change the path of the translation files
            fallbackLocale: Locale('ar'),
            assetLoader: CodegenLoader(),
            child: MyApp()),
      ),
    );
  } else {
    runApp(
      EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path:
              'assets/translations', // <-- change the path of the translation files
          fallbackLocale: Locale('ar'),
          assetLoader: CodegenLoader(),
          child: MyApp()),
    );
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
    // those functions are in Splash view initstate because of context issue of navigation
    // NotificationService().setupInteractedMessageForBackgroundNotification(context);
    // NotificationService().setupInteractedMessageForTerminatedState(context);
    //--------------------------------------------------------------------------------------
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(),
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
      child: CustomMaterialApp(),
      
    );
  }
}

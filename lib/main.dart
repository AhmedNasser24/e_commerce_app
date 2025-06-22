import 'dart:developer';
import 'package:e_commerce/core/manager/locale_cubit/locale_cubit.dart';
import 'package:e_commerce/core/services/notification_service.dart';
import 'package:e_commerce/core/services/supabase_storage_service.dart';
import 'package:e_commerce/custom_material_app.dart';
import 'package:e_commerce/features/customer/presentation/manager/buy%20product_cubit/buy_product_cubit.dart';
import 'package:e_commerce/features/trader/data/repo/trader_repo.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'core/utils/get_it_setup.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'features/customer/data/repo/customer_repo.dart';
import 'features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'firebase_options.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("BackgroundHandler succeed");
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SupabaseStorageService.init();
  getItSetup();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Bloc.observer = SimpleBlocObserver();
  SharedPreferenceSingleton.init();
  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://e145213b4918b2b73940f2ca2dba97ff@o4508040243249152.ingest.us.sentry.io/4508040253079552';

        options.tracesSampleRate = 0.01;
      },
      appRunner: () => runApp(MyApp()),
    );
  } else {
    runApp(MyApp());
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
          create: (context) =>
              FetchCategoryProductsForTraderCubit(getIt<TraderRepo>()),
        ),
        BlocProvider(
          create: (context) => FetchNewOrdersCubit(getIt<TraderRepo>()),
        ),
        BlocProvider(
          create: (context) => NotificationCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(getIt<CustomerRepo>()),
        ),
        BlocProvider(
          create: (context) => BuyProductCubit(getIt<CustomerRepo>()),
        ),
      ],
      child: CustomMaterialApp(),
    );
  }
}

import 'dart:developer';
import 'package:dartz/dartz.dart' as dz;
import 'package:e_commerce/core/utils/notification_service.dart';
import 'package:e_commerce/features/trader/presentation/manager/fetch_category_products_for_trader/fetch_category_products_for_trader_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc_observer.dart';
import 'constants.dart';
import 'core/errors/failure.dart';
import 'core/utils/shared_preference_singleton.dart';
import 'features/auth/data/models/register_model.dart';
import 'features/auth/data/repos/auth_repo_iml.dart';
import 'features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
// import 'features/notifications/presentation/views/notification_view.dart';
import 'features/customer/presentation/manager/cart_cubit/cart_cubit.dart';
import 'features/notifications/presentation/manager/notification_cubit/notification_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';
import 'features/trader/presentation/manager/fetch_new_orders_cubit/fetch_new_orders_cubit.dart';
import 'features/trader/presentation/manager/image_picker_cubit/image_picker_cubit.dart';
import 'firebase_options.dart';
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
    checkIfLogin();
    //--------------------------------------------------------------------------------------
    // those functions are in login view initstate because of context issue of navigation
    // NotificationService().setupInteractedMessageForBackgroundNotification(context);
    // NotificationService().setupInteractedMessageForTerminatedState(context);
    //--------------------------------------------------------------------------------------
    super.initState();
  }

  bool isLogin = false;
  String? userKind;
  var auth = FirebaseAuth.instance;
  void checkIfLogin() {
    auth.authStateChanges().listen((User? user) async {
      if (user != null && mounted) {
        userKind = await getUserInfo();
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  Future<String?> getUserInfo() async {
    dz.Either<UserInfoModel, Failure> userResponse =
        await AuthRepoIml().getUserInfoModel();
    String? userKind;
    userResponse.fold(
      (userInfoModel) {
        if (userInfoModel.accountKind == kTraderAccountKindEnglish ||
            userInfoModel.accountKind == kTraderAccountKindArabic) {
          userKind = kTrader;
        } else {
          userKind = kCustomer;
        }
      },
      (fail) {
        userKind = null;
      },
    );
    return userKind;
  }

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
      child: CustomMaterialApp(isLogin: isLogin, userKind: userKind),
    );
  }
}

class CustomMaterialApp extends StatefulWidget {
  const CustomMaterialApp({
    super.key,
    required this.isLogin,
    required this.userKind,
  });
  final bool isLogin;
  final String? userKind;

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
    return BlocBuilder<LocalCubit, Locale>(
      builder: (context, state) {
        return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // locale: state,
            // localizationsDelegates: const [
            //   S.delegate,
            //   GlobalMaterialLocalizations.delegate,
            //   GlobalWidgetsLocalizations.delegate,
            //   GlobalCupertinoLocalizations.delegate,
            // ],
            // supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: SplashView(
              isLogin: widget.isLogin,
              userKind: widget.userKind,
            ));
        // widget.isLogin ? (widget.userKind == kTrader ? const TraderHomeViewBlocProvider() : const CustomerHomeViewBlocProvider()) : const LoginView());
      },
    );
  }
}

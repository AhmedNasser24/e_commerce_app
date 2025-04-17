// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_style.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/shared_preference_singleton.dart';
import '../../../../generated/locale_keys.g.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../customer/presentation/views/widgets/customer_home_view_bloc_provider.dart';
import '../../../onboarding/presentation/views/onboarding_view.dart';
import '../../../trader/presentation/views/widgets/trader_home_view_bloc_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key,});
  static const String routeName = "/splashView";
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void initState() {
    splashLogic();
    super.initState();
  }

  

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              children: [
                const Spacer(),
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Image.asset(Assets.imagesAppLogo)),
                const Gap(20),
                Text(
                  LocaleKeys.splash_title.tr(),
                  style: AppStyle.bold28,
                  textAlign: TextAlign.center,
                ),
                Text(
                  LocaleKeys.splash_subtitle.tr(),
                  style: AppStyle.regular14,
                  textAlign: TextAlign.center,
                ),
                const Spacer(
                  flex: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void splashLogic() {
    Future.delayed(const Duration(seconds: 5), () {
      if (SharedPreferenceSingleton.getbool(kIsONBoardingVisited)) {
        bool isLogin = SharedPreferenceSingleton.getbool(kIsLogin);
        String userKind = SharedPreferenceSingleton.getString(kAccountKind);
        if (isLogin && userKind == kTrader) {
          
          Navigator.pushReplacementNamed(
              context,
              TraderHomeViewBlocProvider.routeName);
        } else if (isLogin && userKind == kCustomer) {
          Navigator.pushReplacementNamed(
              context,
              CustomerHomeViewBlocProvider.routeName);
          return;
        } else {
          Navigator.pushReplacementNamed(
              context,
              LoginView.routeName);
        }
      } else {
        Navigator.pushReplacementNamed(context,
            OnboardingView.routeName);
      }
    });
  }
}

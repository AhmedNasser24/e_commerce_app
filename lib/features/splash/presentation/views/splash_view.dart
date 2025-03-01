import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/shared_preference_singleton.dart';
import '../../../auth/presentation/views/login_view.dart';
import '../../../customer/presentation/views/widgets/customer_home_view_bloc_provider.dart';
import '../../../onboarding/presentation/views/onboarding_view.dart';
import '../../../trader/presentation/views/widgets/trader_home_view_bloc_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key, required this.isLogin, required this.userKind});
  final bool isLogin;
  final String? userKind;
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
    Future.delayed(const Duration(seconds: 5), () {
      if (SharedPreferenceSingleton.getbool(kIsONBoardingVisited)) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => widget.isLogin ? (widget.userKind == kTrader ? const TraderHomeViewBlocProvider() : const CustomerHomeViewBlocProvider()) : const LoginView()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const OnboardingView()));
      }
    });
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
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Image.asset(Assets.imagesAppLogo)),
              const Gap(20),
              const Text("E Commmerce ", style: AppStyle.bold28),
              const Text("for both Trader & Customer",
                  style: AppStyle.regular14),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

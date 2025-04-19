import 'package:e_commerce/features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/navigate_to_register_view.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/menu_icon_button_for_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../constants.dart';
import '../../../../core/services/notification_service.dart';
import '../../../../core/utils/get_it_setup.dart';
import '../../data/repos/auth_repo.dart';
import 'widgets/login_body.dart';
import 'widgets/login_drawer.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });
  static const String routeName = "/loginView";
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  void initState() {
    NotificationService().subscribeToTopic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: kOffWhiteColor,
        body: const SafeArea(child: LoginBody()),
        appBar: AppBar(
          leading: MenuIconButtonForLogin(scaffoldKey: scaffoldKey),
          actions: const [NavigateToRegisterView()],
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: kPurpleColor,
        ),
        drawer: const Drawer(
          child: LoginDrawer(),
        ),
      ),
    );
  }
}

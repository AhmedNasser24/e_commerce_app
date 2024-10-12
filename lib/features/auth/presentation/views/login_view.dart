import 'package:e_commerce/features/auth/presentation/views/widgets/navigate_to_register_view.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/menu_icon_button_for_login.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../core/utils/notification_service.dart';
import 'widgets/login_body.dart';
import 'widgets/login_drawer.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    super.key,
  });

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    NotificationService()
        .setupInteractedMessageForBackgroundNotification(context);
    NotificationService().setupInteractedMessageForTerminatedState(context);
    NotificationService().subscribeToTopic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}

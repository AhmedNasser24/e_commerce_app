import 'package:e_commerce/core/widgets/select_language.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/navigate_to_register_view.dart';
import 'package:e_commerce/features/trader/presentation/views/widgets/menu_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/notification_service.dart';
import 'widgets/login_body.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.changeLanguage});
  final void Function(Locale newLocale) changeLanguage;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    // NotificationService().setupInteractedMessageForBackgroundNotification(context);
    // NotificationService().setupInteractedMessageForTerminatedState(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body:  SafeArea(child: LoginBody(changeLanguage: widget.changeLanguage)),
      appBar: AppBar(
        leading: MenuIconButton(scaffoldKey: scaffoldKey),
        actions: const [NavigateToRegisterView()],
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      drawer: Drawer(
        child: LoginDrawer(changeLanguage: widget.changeLanguage),
      ),
    );
  }
}

class LoginDrawer extends StatelessWidget {
  const LoginDrawer({
    super.key, required this.changeLanguage,
    
  });

    final void Function(Locale newLocale) changeLanguage;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        SelectLanguage(changeLanguage: changeLanguage),
      ],
    );
  }
}

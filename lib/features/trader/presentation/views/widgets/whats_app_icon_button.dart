import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/functions/show_snack_bar.dart';

class WhatsAppIconButton extends StatelessWidget {
  const WhatsAppIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        FontAwesomeIcons.whatsapp,
        color: Colors.green,
        size: 35,
      ),
    );
  }
  Future<void> whatsapp(context) async {
    String phoneNumber = '+201066505898';
    // Uri url = Uri.parse('whatsapp://send?phone=$phoneNumber');  please note that starting from WhatsApp version 2.21.100 and later, WhatsApp has implemented a security feature that restricts launching the app using URL schemes directly. This means that this method may not work with recent versions of WhatsApp.
    Uri url = Uri.parse(
        'https://wa.me/$phoneNumber'); // this method will open whatsapp on browser , and if whatsapp app is installed , it will automatically open the app
    await canLaunchMyUrl(url, context);
  }

  Future<void> canLaunchMyUrl(Uri url, context) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
      
    } else {
      showSnackBar(context, url.toString());
    }
  }
}

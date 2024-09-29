import 'dart:io';

Future <bool> hasNetwork() async {
  final result = await InternetAddress.lookup('google.com');
  if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
    return true;
  }
  return false;
}

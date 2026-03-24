import 'package:url_launcher/url_launcher_string.dart';

Future<bool> openURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
    return true;
  } else {
    return false;
  }
}

import 'package:url_launcher/url_launcher_string.dart';

Future<bool> openURL(String url) async {
  if (await canLaunchUrlString(url)) {
    await launchUrlString(url);
    return true;
  } else {
    return false;
  }
}

String getLocalizedDateTime(DateTime dateTime) {
  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  final seconds = dateTime.millisecondsSinceEpoch ~/ 1000;

  final elapsed = now - seconds;

  if (elapsed > 60 * 60 * 24) {
    final value = elapsed ~/ (60 * 60 * 24);
    return "$value日前";
  } else if (elapsed > 60 * 60) {
    final value = elapsed ~/ (60 * 60);
    return "約$value時間前";
  } else if (elapsed > 60) {
    final value = elapsed ~/ 60;
    return "約$value分前";
  }

  return "$elapsed秒前";
}

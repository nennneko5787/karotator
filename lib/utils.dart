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
  final now = DateTime.now();
  final difference = now.difference(dateTime);

  if (difference.inDays > 0) {
    return "${difference.inDays}日前";
  } else if (difference.inHours > 0) {
    return "約${difference.inHours}時間前";
  } else if (difference.inMinutes > 0) {
    return "約${difference.inMinutes}分前";
  } else {
    return "${difference.inSeconds}秒前";
  }
}

String getRemainingTime(DateTime dateTime) {
  final now = DateTime.now();
  final difference = dateTime.difference(now);

  if (difference.isNegative) {
    return "既に終了";
  }

  final days = difference.inDays;
  final hours = difference.inHours % 24;
  final minutes = difference.inMinutes % 60;
  final seconds = difference.inSeconds % 60;

  final parts = <String>[];
  if (days > 0) parts.add("$days日");
  if (hours > 0) parts.add("$hours時間");
  if (minutes > 0) parts.add("$minutes分");
  if (seconds > 0 && days == 0 && hours == 0 && minutes == 0) {
    parts.add("$seconds秒");
  }

  return "残り${parts.join("と")}";
}

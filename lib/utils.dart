import 'dart:typed_data';

import 'package:media_kit/media_kit.dart';
import 'package:media_kit_video/media_kit_video.dart';
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

Future<Uint8List?> getVideoThumbnail(String videoPath) async {
  final player = Player();
  final _ = VideoController(player);

  await player.open(Media(videoPath));
  // 少し待ってフレームが来るのを待つ
  await Future.delayed(const Duration(milliseconds: 500));

  final screenshot = await player.screenshot();

  await player.dispose();
  return screenshot;
}

String getMimeType(String path) {
  final ext = path.split('.').last.toLowerCase();
  const mimeTypes = {
    // 画像
    'jpg': 'image/jpeg',
    'jpeg': 'image/jpeg',
    'jpe': 'image/jpeg',
    'jfif': 'image/jpeg',
    'pjpeg': 'image/jpeg',
    'pjp': 'image/jpeg',
    'png': 'image/png',
    'apng': 'image/apng',
    'gif': 'image/gif',
    'webp': 'image/webp',
    'heic': 'image/heic',
    'heif': 'image/heif',
    'tiff': 'image/tiff',
    'tif': 'image/tiff',
    'bmp': 'image/bmp',
    'ico': 'image/x-icon',
    'svg': 'image/svg+xml',
    'svgz': 'image/svg+xml',
    'xbm': 'image/x-xbitmap',
    'xjk': 'image/x-xbitmap',
    'avif': 'image/avif',
    // 動画
    'mp4': 'video/mp4',
    'mov': 'video/quicktime',
    'm4v': 'video/x-m4v',
    'avi': 'video/x-msvideo',
    'mkv': 'video/x-matroska',
    'webm': 'video/webm',
    'wmv': 'video/x-ms-wmv',
    'mpg': 'video/mpeg',
    'mpeg': 'video/mpeg',
    'mpe': 'video/mpeg',
    'ogv': 'video/ogg',
    'ogm': 'video/ogg',
    'asx': 'video/x-ms-asf',
  };
  return mimeTypes[ext] ?? 'application/octet-stream';
}

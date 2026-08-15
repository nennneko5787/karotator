import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/user.dart';
import 'package:system_fonts/system_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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

/// 「14:32 · 2026年8月15日」。カロート詳細の主役だけ絶対時刻で出す。
String getAbsoluteDateTime(DateTime dateTime) {
  final local = dateTime.toLocal();
  final hour = local.hour.toString().padLeft(2, '0');
  final minute = local.minute.toString().padLeft(2, '0');
  return "$hour:$minute · ${local.year}年${local.month}月${local.day}日";
}

/// 件数の丸め。1 万を超えたら「1.2万」、1 億を超えたら「1.2億」。
///
/// 1 万未満は 3 桁区切りでそのまま出す。
String formatCount(int count) {
  if (count < 0) return "0";
  if (count < 10000) return _withThousandsSeparator(count);
  if (count < 100000000) return "${_trimZero(count / 10000)}万";
  return "${_trimZero(count / 100000000)}億";
}

String _withThousandsSeparator(int value) {
  final digits = value.toString();
  final buffer = StringBuffer();
  for (var i = 0; i < digits.length; i++) {
    if (i > 0 && (digits.length - i) % 3 == 0) buffer.write(',');
    buffer.write(digits[i]);
  }
  return buffer.toString();
}

/// 小数第 1 位まで。ちょうど割り切れるなら小数点以下を落とす。
String _trimZero(double value) {
  final fixed = value.toStringAsFixed(1);
  return fixed.endsWith('.0') ? fixed.substring(0, fixed.length - 2) : fixed;
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

Future<Uint8List> getImageFileFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');
  return byteData.buffer.asUint8List();
}

Future<Uint8List?> getVideoThumbnail(String videoPath) async {
  try {
    final thumbnailData = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 200,
      quality: 75,
    );
    return thumbnailData;
  } catch (e) {
    if (e is MissingPluginException || e is UnimplementedError) {
      return await getImageFileFromAssets("images/dummy_image.png");
    } else {
      rethrow;
    }
  }
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

/// 公式マークの色。出典は Karotter Web の `OfficialMarkBadge` チャンク。
Color getOfficialMarkColor(OfficialMark mark) => switch (mark) {
  OfficialMark.BLUE => const Color(0xFF1D9BF0),
  OfficialMark.YELLOW => const Color(0xFFF8C500),
  OfficialMark.ORANGE => const Color(0xFFFF7A00),
  OfficialMark.PURPLE => const Color(0xFF8B5CF6),
  OfficialMark.GRAY => const Color(0xFF9CA3AF),
  OfficialMark.BLACK => const Color(0xFF111827),
  OfficialMark.RED => const Color(0xFFFF0000),
  OfficialMark.GREEN => const Color(0xFF22C55E),
  OfficialMark.PINK => const Color(0xFFFB92BD),
  OfficialMark.CORAL => const Color(0xFFFF7F6A),
  OfficialMark.MAGENTA => const Color(0xFFD1007D),
  OfficialMark.LIME => const Color(0xFF65A30D),
  OfficialMark.BROWN => const Color(0xFF8B4513),
  OfficialMark.NONE => const Color(0xFF9CA3AF),
};

List<Icon> getUserPrimaryMark(AbstractUser user, {double? size}) {
  // 運営が強制的に付けた印は本人の設定より優先される。
  if (user.effectiveBot) return [Icon(Icons.smart_toy, size: size)];
  if (user.effectiveParody) return [Icon(Icons.theater_comedy, size: size)];
  return (user.officialMark.isNotEmpty)
      ? [
          Icon(
            Icons.verified,
            color: getOfficialMarkColor(user.officialMark[0]),
            size: size,
          ),
        ]
      : [];
}

List<String> fonts = [];

Future<void> loadAllFonts() async {
  if (!Platform.isAndroid && !Platform.isIOS) {
    fonts = await SystemFonts().loadAllFonts();
  }
}

/// `1:23` / `1:02:03`。音声や動画の再生位置に使う。
String formatDuration(Duration duration) {
  final total = duration.isNegative ? Duration.zero : duration;
  final hours = total.inHours;
  final minutes = total.inMinutes % 60;
  final seconds = total.inSeconds % 60;
  final mm = hours > 0 ? minutes.toString().padLeft(2, '0') : '$minutes';
  return hours > 0
      ? '$hours:$mm:${seconds.toString().padLeft(2, '0')}'
      : '$mm:${seconds.toString().padLeft(2, '0')}';
}

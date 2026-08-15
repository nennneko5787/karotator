import 'package:flutter/material.dart';

final messengerKey = GlobalKey<ScaffoldMessengerState>();
final navigatorKey = GlobalKey<NavigatorState>();

/// Karotter Web のホスト。
///
/// API (`api.karotter.com`) とは別。アバター・ヘッダー・添付メディアの URL は
/// `/uploads/...` のような**相対パス**で返ってくるので、こちらを前に付けて使う。
const karotterHost = 'karotter.com';
const karotterOrigin = 'https://$karotterHost';

/// API が返す相対パスを絶対 URL にする。
///
/// **既に絶対 URL のものはそのまま返す。** 外部認証のアバターなど、
/// `https://` で始まる値が混ざることがあり、素で連結すると
/// `karotter.comhttps://...` という不正なホスト名になる。
String karotterUrl(String path) {
  if (path.isEmpty) return karotterOrigin;
  if (_absoluteUrl.hasMatch(path)) return path;
  // `//example.com/a.png` のようなプロトコル相対も来うる。
  if (path.startsWith('//')) return 'https:$path';
  return path.startsWith('/')
      ? '$karotterOrigin$path'
      : '$karotterOrigin/$path';
}

final _absoluteUrl = RegExp(r'^[a-z][a-z0-9+.-]*:', caseSensitive: false);

/// アバターの URL。未設定なら Karotter の既定アイコン。
String avatarUrlOf(String? path) => karotterUrl(path ?? '/default-avatar.png');

/// アバターの画像。
///
/// 未設定なら同梱の既定アイコンを使う。ネットワークに出ないので、
/// 既定アイコンの取得が失敗して `Invalid image data` になることがない。
ImageProvider avatarImageOf(String? path) => (path == null || path.isEmpty)
    ? const AssetImage('assets/images/default-avatar.png')
    : NetworkImage(karotterUrl(path));

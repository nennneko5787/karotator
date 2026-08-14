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
String karotterUrl(String path) => '$karotterOrigin$path';

/// アバターの URL。未設定なら Karotter の既定アイコン。
String avatarUrlOf(String? path) =>
    karotterUrl(path ?? '/default-avatar.png');

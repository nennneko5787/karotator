import 'package:karotator/api/client.dart';
import 'package:karotator/api/endpoints/auth.dart';
import 'package:karotator/api/endpoints/boards.dart';
import 'package:karotator/api/endpoints/dm.dart';
import 'package:karotator/api/endpoints/legal.dart';
import 'package:karotator/api/endpoints/notifications.dart';
import 'package:karotator/api/endpoints/posts.dart';
import 'package:karotator/api/endpoints/search.dart';
import 'package:karotator/api/endpoints/social.dart';
import 'package:karotator/api/endpoints/users.dart';
import 'package:karotator/api/session/session.dart';

export 'package:karotator/api/client.dart' show KarotterFile, clientType;
export 'package:karotator/api/exceptions.dart';
export 'package:karotator/api/endpoints/users.dart' show UserTab;
export 'package:karotator/api/session/session.dart';

/// Karotter API への入口 (REQ-API-004)。
///
/// ```dart
/// await KarotterApi().initialize();
/// final timeline = await KarotterApi().posts.timeline(page: 1, limit: 20, mode: 'following');
/// ```
///
/// 現行の `HTTPClient` と同じくシングルトン。Riverpod への移行は別の仕様で扱う。
class KarotterApi {
  factory KarotterApi() => _instance;

  KarotterApi._internal() : session = KarotterSession() {
    _http = KarotterHttpClient(session: session);
    auth = AuthApi(_http, session);
    posts = PostsApi(_http);
    users = UsersApi(_http);
    social = SocialApi(_http);
    boards = BoardsApi(_http);
    notifications = NotificationsApi(_http);
    dm = DmApi(_http);
    legal = LegalApi(_http);
    search = SearchApi(_http);
  }

  static final KarotterApi _instance = KarotterApi._internal();

  /// 今どのアカウントで動いているか。
  final KarotterSession session;

  late final KarotterHttpClient _http;

  late final AuthApi auth;
  late final PostsApi posts;
  late final UsersApi users;
  late final SocialApi social;
  late final BoardsApi boards;
  late final NotificationsApi notifications;
  late final DmApi dm;
  late final LegalApi legal;
  late final SearchApi search;

  /// 起動時に一度だけ呼ぶ。
  Future<void> initialize() => session.initialize();

  bool get initialized => session.initialized;

  void close() => _http.close();
}

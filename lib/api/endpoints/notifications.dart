import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/response.dart';

/// `/notifications` — 通知。
class NotificationsApi extends KarotterEndpoints {
  const NotificationsApi(super.http);

  Future<NotificationResponse> list({
    required int page,
    required int limit,
  }) async {
    final res = await http.get(
      'notifications',
      query: {'page': page, 'limit': limit},
    );
    return NotificationResponse.fromJson(res.json);
  }

  Future<int> unreadCount() async {
    final res = await http.get('notifications/unread/count');
    return res.json['count'] as int? ?? 0;
  }

  Future<void> markAllAsRead() => http.patch('notifications/read-all');

  /// まとめて表示されている通知の元カロートをまとめて引く。
  ///
  /// 「〇〇さん他 3 人がいいねしました」の中身を開くときに使う。
  Future<List<NotificationPost>> groupedPosts(List<int> notificationIds) async {
    final res = await http.get(
      'notifications/grouped-posts',
      query: {'notificationIds': notificationIds.join(',')},
    );
    return res.list('posts', NotificationPost.fromJson);
  }

  // ---- プッシュ通知 ----

  /// プッシュ通知のトークンを登録する。
  Future<void> registerPush({
    required String token,
    required String platform,
  }) => http.post(
    'notifications/push/register',
    json: {'token': token, 'platform': platform},
  );

  Future<void> unregisterPush({required String token}) =>
      http.post('notifications/push/unregister', json: {'token': token});
}

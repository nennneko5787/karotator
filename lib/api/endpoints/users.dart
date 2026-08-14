import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/objects/response.dart';
import 'package:karotator/objects/user.dart';

/// プロフィールタブ。`GET /users/{id}/{tab}` の `{tab}` に入る。
enum UserTab { posts, replies, media, likes }

/// `/users` と `/follow` — 人。
///
/// `follow` は Karotter 側では別カテゴリだが、扱う対象が同じ「ユーザー」なので
/// ここに同居させる (design.md §5)。
class UsersApi extends KarotterEndpoints {
  const UsersApi(super.http);

  // ---- 取得 ----

  /// ユーザー名からプロフィールを引く。フォロー状態なども一緒に返る。
  Future<UserResponse> byUsername(String username) async {
    final res = await http.get('users/$username');
    return UserResponse.fromJson(res.json);
  }

  /// プロフィールのタブ。ページ番号方式。
  Future<RecommendedResponse> tab(
    UserTab tab, {
    required int? userId,
    required int page,
    required int limit,
  }) async {
    final res = await http.get(
      'users/$userId/${tab.name}',
      query: {'page': page, 'limit': limit},
    );
    return RecommendedResponse.fromJson(res.json);
  }

  Future<RecommendedResponse> posts({
    required int? userId,
    required int page,
    required int limit,
  }) => tab(UserTab.posts, userId: userId, page: page, limit: limit);

  Future<RecommendedResponse> replies({
    required int? userId,
    required int page,
    required int limit,
  }) => tab(UserTab.replies, userId: userId, page: page, limit: limit);

  Future<RecommendedResponse> media({
    required int? userId,
    required int page,
    required int limit,
  }) => tab(UserTab.media, userId: userId, page: page, limit: limit);

  Future<RecommendedResponse> likes({
    required int? userId,
    required int page,
    required int limit,
  }) => tab(UserTab.likes, userId: userId, page: page, limit: limit);

  /// おすすめユーザー。
  Future<List<Author>> recommended({int limit = 3}) async {
    final res = await http.get('users/recommended', query: {'limit': limit});
    return res.list('users', Author.fromJson);
  }

  // ---- 自分の設定 ----

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) => http.patch(
    'users/password',
    json: {'currentPassword': currentPassword, 'newPassword': newPassword},
  );

  /// プロフィールを更新する。渡した項目だけが変わる。
  Future<User> updateProfile(Map<String, Object?> changes) async {
    final res = await http.patch('users/profile', json: changes);
    return res.object('user', User.fromJson);
  }

  /// アプリ設定（公開範囲など）を更新する。
  Future<void> updateSettings(Map<String, Object?> changes) =>
      http.patch('users/settings', json: changes);

  /// オンライン状態を更新する。
  Future<void> updateStatus(Map<String, Object?> changes) =>
      http.patch('users/status', json: changes);

  /// プロフィールにピン留めするカロートを変える。[postId] が null で解除。
  Future<void> pinPost(int? postId) =>
      http.patch('users/profile/pinned-post', json: {'postId': postId});

  // ---- フォロー ----

  Future<void> follow(int userId) => http.post('follow/$userId');

  Future<void> unfollow(int userId) => http.delete('follow/$userId');

  /// フォロワーから外す（相手のフォローを解除させる）。
  Future<void> removeFollower(int userId) =>
      http.delete('follow/follower/$userId');

  /// このユーザーの投稿通知を受け取る。
  Future<void> enablePostNotify(int userId) =>
      http.post('follow/$userId/post-notify');

  Future<void> disablePostNotify(int userId) =>
      http.delete('follow/$userId/post-notify');

  /// このユーザーのカロートをタイムラインに出さない。
  Future<void> hideRekarots(int userId) =>
      http.post('follow/hide-rekarots/$userId');

  Future<void> showRekarots(int userId) =>
      http.delete('follow/hide-rekarots/$userId');

  // ---- ブロック / ミュート ----

  Future<List<Author>> blocked() async {
    final res = await http.get('follow/block');
    return res.list('users', Author.fromJson);
  }

  Future<void> block(int userId) => http.post('follow/block/$userId');

  Future<void> unblock(int userId) => http.delete('follow/block/$userId');

  Future<List<Author>> muted() async {
    final res = await http.get('follow/mute');
    return res.list('users', Author.fromJson);
  }

  Future<void> mute(int userId) => http.post('follow/mute/$userId');

  Future<void> unmute(int userId) => http.delete('follow/mute/$userId');

  // ---- フォローリクエスト ----

  /// 承認待ちのフォローリクエスト。鍵アカウントで使う。
  ///
  /// 返る `id` はリクエストの ID であってユーザー ID ではない。
  /// [acceptFollowRequest] / [rejectFollowRequest] にはこちらを渡す。
  Future<List<Object?>> pendingFollowRequests() async {
    final res = await http.get('follow/requests/pending');
    return res.json['requests'] as List<Object?>? ?? const [];
  }

  Future<void> acceptFollowRequest(int requestId) =>
      http.post('follow/requests/$requestId/accept');

  Future<void> rejectFollowRequest(int requestId) =>
      http.post('follow/requests/$requestId/reject');
}

import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/objects/circle.dart';
import 'package:karotator/objects/response.dart';

/// `/social` — サークルとリスト。
///
/// サークルは公開範囲の指定に使う閉じたグループ、リストはタイムラインを
/// 絞り込むための集合。API の形はほぼ同じだが用途が違う。
class SocialApi extends KarotterEndpoints {
  const SocialApi(super.http);

  // ---- サークル ----

  Future<List<Circle>> circles() async {
    final res = await http.get('social/circles');
    return res.list('circles', Circle.fromJson);
  }

  Future<Circle> createCircle(String name) async {
    final res = await http.post('social/circles', json: {'name': name});
    return res.object('circle', Circle.fromJson);
  }

  Future<Circle> renameCircle(int circleId, String name) async {
    final res = await http.patch(
      'social/circles/$circleId',
      json: {'name': name},
    );
    return res.object('circle', Circle.fromJson);
  }

  Future<void> deleteCircle(int circleId) =>
      http.delete('social/circles/$circleId');

  Future<void> addCircleMember(int circleId, int userId) =>
      http.post('social/circles/$circleId/members', json: {'userId': userId});

  Future<void> removeCircleMember(int circleId, int userId) =>
      http.delete('social/circles/$circleId/members/$userId');

  // ---- リスト ----

  Future<List<Circle>> lists() async {
    final res = await http.get('social/lists');
    return res.list('lists', Circle.fromJson);
  }

  Future<Circle> createList(String name) async {
    final res = await http.post('social/lists', json: {'name': name});
    return res.object('list', Circle.fromJson);
  }

  Future<Circle> renameList(int listId, String name) async {
    final res = await http.patch('social/lists/$listId', json: {'name': name});
    return res.object('list', Circle.fromJson);
  }

  Future<void> deleteList(int listId) => http.delete('social/lists/$listId');

  Future<void> addListMember(int listId, int userId) =>
      http.post('social/lists/$listId/members', json: {'userId': userId});

  Future<void> removeListMember(int listId, int userId) =>
      http.delete('social/lists/$listId/members/$userId');

  /// リストのタイムライン。
  Future<RecommendedResponse> listPosts({
    required int listId,
    required int page,
    required int limit,
  }) async {
    final res = await http.get(
      'social/lists/$listId/posts',
      query: {'page': page, 'limit': limit},
    );
    return RecommendedResponse.fromJson(res.json);
  }

  // ---- その他 ----

  /// URL のプレビュー（OGP）を引く。
  Future<Map<String, Object?>> linkPreview(String url) async {
    final res = await http.get('social/link-preview', query: {'url': url});
    return res.json;
  }
}

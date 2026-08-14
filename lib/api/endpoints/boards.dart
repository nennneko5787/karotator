import 'dart:io';

import 'package:karotator/api/client.dart';
import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/objects/board.dart';

/// `/boards` — 掲示板。
///
/// 板は `slug`（文字列）、スレッドと返信は数値 ID で指す。
class BoardsApi extends KarotterEndpoints {
  const BoardsApi(super.http);

  /// 板の一覧。
  Future<List<Board>> boards() async {
    final res = await http.get('boards');
    return res.list('boards', Board.fromJson);
  }

  /// フォロー中の板とスレッド。
  ///
  /// 1 回の応答に両方入っている（`boards` と `threads`）。
  Future<({List<Board> boards, List<Thread> threads})> following() async {
    final res = await http.get('boards/following');
    return (
      boards: res.list('boards', Board.fromJson),
      threads: res.list('threads', Thread.fromJson),
    );
  }

  /// 板の中のスレッド一覧。
  Future<List<Thread>> threads({required String slug}) async {
    final res = await http.get('boards/$slug');
    return res.list('threads', Thread.fromJson);
  }

  /// スレッドの返信一覧。
  Future<List<ThreadReply>> replies({
    required String slug,
    required int threadId,
  }) async {
    final res = await http.get('boards/$slug/threads/$threadId');
    return res.list('replies', ThreadReply.fromJson);
  }

  /// スレッドを立てる。
  Future<Thread> createThread({
    required String slug,
    required String title,
    required String content,
    List<File>? medias,
  }) async {
    final res = await http.post(
      'boards/$slug/threads',
      fields: {'title': title, 'content': content},
      files: await _mediaFiles(medias),
    );
    return res.object('thread', Thread.fromJson);
  }

  /// スレッドに返信する。
  Future<ThreadReply> reply(
    String content, {
    required String slug,
    required int threadId,
    List<File>? medias,
  }) async {
    final res = await http.post(
      'boards/$slug/threads/$threadId/replies',
      fields: {'content': content},
      files: await _mediaFiles(medias),
    );
    return res.object('reply', ThreadReply.fromJson);
  }

  Future<void> deleteThread({required String slug, required int threadId}) =>
      http.delete('boards/$slug/threads/$threadId');

  // ---- フォロー ----

  Future<void> followBoard(String slug) => http.post('boards/$slug/follow');

  Future<void> unfollowBoard(String slug) => http.delete('boards/$slug/follow');

  Future<void> followThread({required String slug, required int threadId}) =>
      http.post('boards/$slug/threads/$threadId/follow');

  Future<void> unfollowThread({required String slug, required int threadId}) =>
      http.delete('boards/$slug/threads/$threadId/follow');

  // ---- リアクション ----

  Future<void> reactToThread({
    required String slug,
    required int threadId,
    required String emoji,
  }) => http.post(
    'boards/$slug/threads/$threadId/reactions',
    json: {'emoji': emoji},
  );

  Future<void> reactToReply({
    required String slug,
    required int replyId,
    required String emoji,
  }) => http.post(
    'boards/$slug/replies/$replyId/reactions',
    json: {'emoji': emoji},
  );

  Future<List<KarotterFile>?> _mediaFiles(List<File>? medias) async {
    if (medias == null) return null;
    return [for (final media in medias) await KarotterFile.read(media)];
  }
}

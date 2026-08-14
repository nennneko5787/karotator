import 'dart:convert';
import 'dart:io';

import 'package:karotator/api/client.dart';
import 'package:karotator/api/endpoints/endpoints.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/response.dart';
import 'package:karotator/objects/user.dart';

/// `/posts` — カロートそのもの。
///
/// specs/api/endpoints.md の `posts` カテゴリ（全 37 件のうち karotator が使う分）。
class PostsApi extends KarotterEndpoints {
  const PostsApi(super.http);

  // ---- 取得 ----

  /// フォロー中のタイムライン。ページ番号方式 (conventions.md §7)。
  Future<TimeLineResponse> timeline({
    required int page,
    required int limit,
    required String mode,
  }) async {
    final res = await http.get(
      'posts/timeline',
      query: {'page': page, 'limit': limit, 'mode': mode},
    );
    return TimeLineResponse.fromJson(res.json);
  }

  /// おすすめ。ページ番号方式。
  Future<RecommendedResponse> recommended({
    required int page,
    required int limit,
    required String mode,
  }) async {
    final res = await http.get(
      'posts/recommended',
      query: {'page': page, 'limit': limit, 'mode': mode},
    );
    return RecommendedResponse.fromJson(res.json);
  }

  /// おすすめの `mode=latest`。カーソル方式なのでレスポンスの形が違う。
  Future<RecommendedResponseLatest> recommendedLatest({
    required int? cursor,
    required int limit,
  }) async {
    final res = await http.get(
      'posts/recommended',
      // 初回は cursor を付けない。null はクエリごと落ちる。
      query: {'cursor': cursor, 'limit': limit, 'mode': 'latest'},
    );
    return RecommendedResponseLatest.fromJson(res.json);
  }

  Future<Post> byId(int postId) async {
    final res = await http.get('posts/$postId');
    return res.object('post', Post.fromJson);
  }

  Future<RepliesResponse> replies({
    required int postId,
    required int page,
    required int limit,
  }) async {
    final res = await http.get(
      'posts/$postId/replies',
      query: {'page': page, 'limit': limit},
    );
    return RepliesResponse.fromJson(res.json);
  }

  /// 返信先の候補。返信画面でメンション対象を選ぶのに使う。
  ///
  /// 応答の `candidates` は [Post.replyTargets] と違って**素のユーザー**が並ぶ
  /// （`source` や `postId` は付かない）ので [Author] として読む。
  Future<List<Author>> replyTargets(int postId) async {
    final res = await http.get('posts/$postId/reply-targets');
    return res.list('candidates', Author.fromJson);
  }

  /// ブックマーク一覧。[folderId] を指定するとそのフォルダだけ。
  Future<RecommendedResponse> bookmarks({
    required int page,
    required int limit,
    int? folderId,
  }) async {
    final res = await http.get(
      'posts/me/bookmarks',
      query: {'page': page, 'limit': limit, 'folderId': folderId},
    );
    return RecommendedResponse.fromJson(res.json);
  }

  /// 予約投稿の一覧。応答のキーは `posts` ではなく `scheduledPosts`。
  Future<List<Post>> scheduled() async {
    final res = await http.get('posts/scheduled/me');
    return res.list('scheduledPosts', Post.fromJson);
  }

  Future<void> cancelScheduled(int postId) =>
      http.delete('posts/scheduled/$postId');

  // ---- 投稿 ----

  /// カロートを投稿する。
  ///
  /// 添付があってもなくても `multipart/form-data` で送る (conventions.md §8)。
  /// 配列は JSON 文字列にして 1 フィールドに入れる決まり。
  Future<Post> create(
    String content, {
    bool isAiGenerated = false,
    bool isPromotional = false,
    bool isR18 = false,
    bool hideFromMinors = false,
    PostVisibility visibility = PostVisibility.PUBLIC,
    int? viewerCircleId,
    ReplyRestriction replyRestriction = ReplyRestriction.EVERYONE,
    int? replyCircleId,
    List<String>? mediaAlts,
    List<bool>? mediaSpoilerFlags,
    List<bool>? mediaR18Flags,
    List<String>? pollOptions,
    int? pollDurationHours,
    DateTime? scheduledFor,
    List<File>? medias,
    int? parentId,
    int? quotedPostId,
  }) async {
    final fields = <String, String>{
      'content': content,
      'isAiGenerated': '$isAiGenerated',
      'isPromotional': '$isPromotional',
      'isR18': '$isR18',
      'hideFromMinors': '$hideFromMinors',
      'visibility': visibility.name,
      'replyRestriction': replyRestriction.name,
      'mediaAlts': jsonEncode(mediaAlts ?? const <String>[]),
      'mediaSpoilerFlags': jsonEncode(mediaSpoilerFlags ?? const <bool>[]),
      'mediaR18Flags': jsonEncode(mediaR18Flags ?? const <bool>[]),
      if (visibility == PostVisibility.CIRCLE)
        'viewerCircleId': '$viewerCircleId',
      if (replyRestriction == ReplyRestriction.CIRCLE)
        'replyCircleId': '$replyCircleId',
      if (pollOptions != null) 'pollOptions': jsonEncode(pollOptions),
      if (pollDurationHours != null)
        'pollDurationHours': '$pollDurationHours',
      if (scheduledFor != null)
        'scheduledFor': scheduledFor.toIso8601String(),
      if (parentId != null) 'parentId': '$parentId',
      if (quotedPostId != null) 'quotedPostId': '$quotedPostId',
    };

    final res = await http.post(
      'posts',
      fields: fields,
      files: await _mediaFiles(medias),
    );
    return res.object('post', Post.fromJson);
  }

  Future<void> delete(int postId) => http.delete('posts/$postId');

  /// 会話（スレッド）から抜ける。以後この会話の通知が来なくなる。
  Future<void> leaveConversation(int postId) =>
      http.post('posts/$postId/conversation/leave');

  // ---- 反応 ----

  Future<void> like(int postId) => http.post('posts/$postId/like');

  Future<void> unlike(int postId) => http.delete('posts/$postId/like');

  Future<void> rekarot(int postId) => http.post('posts/$postId/rekarot');

  Future<void> unrekarot(int postId) => http.delete('posts/$postId/rekarot');

  Future<void> bookmark(int postId) => http.post('posts/$postId/bookmark');

  Future<void> unbookmark(int postId) =>
      http.delete('posts/$postId/bookmark');

  Future<void> react(int postId, {required String emoji}) =>
      http.post('posts/$postId/react', json: {'emoji': emoji});

  Future<void> unreact(int postId, {required String emoji}) =>
      http.delete('posts/$postId/react/${Uri.encodeComponent(emoji)}');

  /// 投票する。更新後の投票結果が返る。
  Future<Poll> vote(int postId, {required int optionId}) async {
    final res = await http.post(
      'posts/$postId/poll/vote',
      json: {'optionId': optionId},
    );
    return res.object('poll', Poll.fromJson);
  }

  Future<List<KarotterFile>?> _mediaFiles(List<File>? medias) async {
    if (medias == null) return null;
    return [for (final media in medias) await KarotterFile.read(media)];
  }
}

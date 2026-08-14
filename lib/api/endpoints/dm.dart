import 'dart:convert';
import 'dart:io';

import 'package:karotator/api/client.dart';
import 'package:karotator/api/endpoints/endpoints.dart';

/// `/dm` — ダイレクトメッセージ。
///
/// 1 対 1 も「メンバーが 2 人のグループ」として扱われる。karotator 側の
/// モデルがまだ無いので、当面は素の JSON を返す。
class DmApi extends KarotterEndpoints {
  const DmApi(super.http);

  /// 未読のあるスレッド数。
  Future<int> unreadCount() async {
    final res = await http.get('dm/unread/count');
    return res.json['count'] as int? ?? 0;
  }

  /// スレッド一覧。
  Future<Map<String, Object?>> groups({int page = 1, int limit = 30}) async {
    final res = await http.get(
      'dm/groups',
      query: {'page': page, 'limit': limit},
    );
    return res.json;
  }

  Future<Map<String, Object?>> group(int groupId) async {
    final res = await http.get('dm/groups/$groupId');
    return res.json;
  }

  /// スレッドを作る。相手が 1 人でも [isGroup] を false にすれば 1 対 1。
  Future<Map<String, Object?>> createGroup({
    required List<int> userIds,
    String? name,
    bool? isGroup,
  }) async {
    final res = await http.post(
      'dm/groups',
      json: {
        'userIds': userIds,
        'name': name,
        'isGroup': isGroup ?? userIds.length > 1,
      },
    );
    return res.json;
  }

  /// 相手を指定して会話を始める。既にあればそれを返す。
  Future<Map<String, Object?>> start(int userId) async {
    final res = await http.post('dm/start', json: {'userId': userId});
    return res.json;
  }

  Future<Map<String, Object?>> messages(
    int groupId, {
    int page = 1,
    int limit = 20,
  }) async {
    final res = await http.get(
      'dm/groups/$groupId/messages',
      query: {'page': page, 'limit': limit},
    );
    return res.json;
  }

  /// メッセージを送る。
  ///
  /// 添付のフィールド名は `attachments`。カロートの `media` とは違う
  /// (specs/api/conventions.md §8)。
  Future<Map<String, Object?>> sendMessage({
    required int groupId,
    required String content,
    List<File>? attachments,
    List<String>? attachmentAlts,
    List<bool>? attachmentSpoilerFlags,
    List<bool>? attachmentR18Flags,
    int? replyToId,
    List<String>? pollOptions,
    int? pollDurationHours,
  }) async {
    final res = await http.post(
      'dm/groups/$groupId/messages',
      fields: {
        'content': content,
        if (replyToId != null) 'replyToId': '$replyToId',
        if (pollOptions != null && pollOptions.isNotEmpty)
          'pollOptions': jsonEncode(pollOptions),
        if (pollDurationHours != null)
          'pollDurationHours': '$pollDurationHours',
        if (attachmentAlts != null && attachmentAlts.isNotEmpty)
          'attachmentAlts': jsonEncode(attachmentAlts),
        if (attachmentSpoilerFlags != null &&
            attachmentSpoilerFlags.isNotEmpty)
          'attachmentSpoilerFlags': jsonEncode(attachmentSpoilerFlags),
        if (attachmentR18Flags != null && attachmentR18Flags.isNotEmpty)
          'attachmentR18Flags': jsonEncode(attachmentR18Flags),
      },
      files: [
        for (final file in attachments ?? const <File>[])
          await KarotterFile.read(file, field: 'attachments'),
      ],
    );
    return res.json;
  }

  Future<void> markAsRead(int groupId) =>
      http.post('dm/groups/$groupId/read');

  Future<void> deleteMessage(int messageId) =>
      http.delete('dm/messages/$messageId');

  Future<void> editMessage(int messageId, String content) =>
      http.patch('dm/messages/$messageId', json: {'content': content});

  Future<void> react(int messageId, {required String emoji}) =>
      http.post('dm/messages/$messageId/reactions', json: {'emoji': emoji});

  Future<void> vote(int messageId, {required int optionId}) =>
      http.post('dm/messages/$messageId/poll/vote', json: {'optionId': optionId});

  // ---- メンバー ----

  Future<void> addMembers(int groupId, List<int> userIds) =>
      http.post('dm/groups/$groupId/members', json: {'userIds': userIds});

  Future<void> removeMember(int groupId, int userId) =>
      http.delete('dm/groups/$groupId/members/$userId');

  Future<void> leave(int groupId) => http.post('dm/groups/$groupId/leave');

  /// スレッドの履歴を自分の側から消す。相手側には残る。
  Future<void> clear(int groupId) => http.post('dm/groups/$groupId/clear');
}

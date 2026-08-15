import 'package:flutter/material.dart';
import 'package:karotator/api/exceptions.dart';
import 'package:karotator/providers/api.dart';
import 'package:karotator/objects/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post.g.dart';

@riverpod
class PostNotifier extends _$PostNotifier {
  bool _initialize = false;
  bool _retained = false;

  @override
  Post build(int postId) => Post.empty();

  void initialize(Post post) {
    if (_initialize) return;
    _initialize = true;

    state = post;
  }

  /// 楽観更新した状態を画面外でも保持する。
  ///
  /// このプロバイダは autoDispose なので、カロートがスクロールで画面外へ
  /// 出ると破棄される。戻ってくると [build] の `Post.empty()` から作り直され、
  /// [initialize] に**一覧が持っている古い `Post`** が渡る。その結果、
  /// 押したはずのいいねやリアクションが消えて見える。
  ///
  /// 触ったカロートだけを残す。全件 keepAlive にするとタイムラインを
  /// 送るほど際限なく溜まる。
  void _retain() {
    if (_retained) return;
    _retained = true;
    ref.keepAlive();
  }

  Future<void> toggleLike() async {
    _retain();
    final current = state;

    state = current.copyWith(
      liked: !current.liked,
      likesCount: current.liked
          ? current.likesCount - 1
          : current.likesCount + 1,
    );

    try {
      if (!current.liked) {
        await ref.read(postsApiProvider).like(current.id);
      } else {
        await ref.read(postsApiProvider).unlike(current.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        // 楽観更新を捨てて、送信前の状態に戻す。
        state = current;
        rethrow;
      }
    }
  }

  Future<void> toggleRekarot() async {
    _retain();
    final current = state;

    state = current.copyWith(
      rekaroted: !current.rekaroted,
      rekarotsCount: current.rekaroted
          ? current.rekarotsCount - 1
          : current.rekarotsCount + 1,
    );

    try {
      if (!current.rekaroted) {
        await ref.read(postsApiProvider).rekarot(current.id);
      } else {
        await ref.read(postsApiProvider).unrekarot(current.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        state = current;
        rethrow;
      }
    }
  }

  Future<void> toggleBookmark() async {
    _retain();
    final current = state;

    state = current.copyWith(
      bookmarked: !current.bookmarked,
      bookmarksCount: current.bookmarked
          ? current.bookmarksCount - 1
          : current.bookmarksCount + 1,
    );

    try {
      if (!current.bookmarked) {
        await ref.read(postsApiProvider).bookmark(current.id);
      } else {
        await ref.read(postsApiProvider).unbookmark(current.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        state = current;
        rethrow;
      }
    }
  }

  Future<void> addReaction(String emoji) async {
    _retain();
    final current = state;

    state = current.copyWith(
      /*reactions: [
        ...current.reactions,
        Reaction(emoji: emoji, userId: userId), アプデで必要になったら更新する今はいらん
      ],*/
      reactionSummary: [
        for (var s in current.reactionSummary)
          if (s.emoji == emoji)
            s.copyWith(count: s.count + 1, reacted: true)
          else
            s,
        if (!current.reactionSummary.any((s) => s.emoji == emoji))
          ReactionSummary(emoji: emoji, count: 1, reacted: true),
      ],
    );

    try {
      await ref.read(postsApiProvider).react(current.id, emoji: emoji);
    } catch (e) {
      state = current; // ロールバック
      rethrow;
    }
  }

  Future<void> removeReaction(String emoji) async {
    _retain();
    final current = state;

    state = current.copyWith(
      /*reactions: current.reactions
        .where((r) => !(r.emoji == emoji && r.userId == userId))
        .toList(),*/
      reactionSummary: [
        for (var s in current.reactionSummary)
          if (s.emoji == emoji)
            s.copyWith(count: s.count - 1, reacted: false)
          else
            s,
      ]..removeWhere((s) => s.count <= 0),
    );

    try {
      await ref.read(postsApiProvider).unreact(current.id, emoji: emoji);
    } catch (e) {
      state = current; // ロールバック
      rethrow;
    }
  }

  Future<void> poll(int optionId) async {
    _retain();
    final current = state;

    try {
      final poll = await ref
          .read(postsApiProvider)
          .vote(current.id, optionId: optionId);
      state = current.copyWith(poll: poll);
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      rethrow;
    }
  }
}

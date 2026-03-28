import 'package:flutter/material.dart';
import 'package:karotator/exceptions.dart';
import 'package:karotator/http.dart';
import 'package:karotator/objects/post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post.g.dart';

@riverpod
class PostNotifier extends _$PostNotifier {
  bool _initialize = false;

  @override
  Post build(int postId) => Post.empty();

  void initialize(Post post) {
    if (_initialize) return;
    _initialize = true;

    state = post;
  }

  Future<void> toggleLike() async {
    final current = state;

    state = current.copyWith(
      liked: !current.liked,
      likesCount: current.liked
          ? current.likesCount - 1
          : current.likesCount + 1,
    );

    try {
      if (!current.liked) {
        await HTTPClient().like(current.id);
      } else {
        await HTTPClient().dislike(current.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        state = current.copyWith(
          liked: !current.liked,
          likesCount: current.liked
              ? current.likesCount - 1
              : current.likesCount + 1,
        );
        rethrow;
      }
    }
  }

  Future<void> toggleRekarot() async {
    final current = state;

    state = current.copyWith(
      rekaroted: !current.rekaroted,
      rekarotsCount: current.rekaroted
          ? current.rekarotsCount - 1
          : current.rekarotsCount + 1,
    );

    try {
      if (!current.rekaroted) {
        await HTTPClient().rekarot(current.id);
      } else {
        await HTTPClient().unrekarot(current.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        state = current.copyWith(
          rekaroted: !current.rekaroted,
          rekarotsCount: current.rekaroted
              ? current.rekarotsCount - 1
              : current.rekarotsCount + 1,
        );
        rethrow;
      }
    }
  }

  Future<void> toggleBookmark() async {
    final current = state;

    state = current.copyWith(
      bookmarked: !current.bookmarked,
      bookmarksCount: current.bookmarked
          ? current.bookmarksCount - 1
          : current.bookmarksCount + 1,
    );

    try {
      if (!current.bookmarked) {
        await HTTPClient().bookmark(current.id);
      } else {
        await HTTPClient().unbookmark(current.id);
      }
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if ((e is! KarotterClientException) || (e.statusCode != 400)) {
        state = current.copyWith(
          bookmarked: !current.bookmarked,
          bookmarksCount: current.bookmarked
              ? current.bookmarksCount - 1
              : current.bookmarksCount + 1,
        );
        rethrow;
      }
    }
  }

  Future<void> addReaction(String emoji) async {
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
      await HTTPClient().react(current.id, emoji: emoji);
    } catch (e) {
      state = current; // ロールバック
      rethrow;
    }
  }

  Future<void> removeReaction(String emoji) async {
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
      await HTTPClient().unreact(current.id, emoji: emoji);
    } catch (e) {
      state = current; // ロールバック
      rethrow;
    }
  }

  Future<void> poll(int optionId) async {
    final current = state;

    try {
      final poll = await HTTPClient().poll(current.id, optionId: optionId);
      state = current.copyWith(poll: poll);
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      rethrow;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:karotator/exceptions.dart';
import 'package:karotator/http.dart';
import 'package:karotator/objects/state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post.g.dart';

@riverpod
class PostNotifier extends _$PostNotifier {
  @override
  PostState build(PostState post) => post;

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
      debugPrint(stackTrace.toString());
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
      debugPrint(stackTrace.toString());
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
      debugPrint(stackTrace.toString());
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
}

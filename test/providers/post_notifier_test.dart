// 楽観更新とロールバックの回帰テスト。
//
// toggleLike / toggleRekarot / toggleBookmark の catch 節が、楽観更新と
// 完全に同じ式を書いていた（＝ロールバックせず、同じ差分をもう一度当てていた）。
// 通信が失敗してもいいねが付いたままの表示で固定される、という不具合だった。

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/api/endpoints/posts.dart';
import 'package:karotator/api/exceptions.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';
import 'package:karotator/providers/api.dart';
import 'package:karotator/providers/post.dart';

/// 呼ばれたら必ず失敗する [PostsApi]。通信はしない。
class _FailingPostsApi implements PostsApi {
  _FailingPostsApi(this.error);

  final Object error;
  final calls = <String>[];

  Future<T> _fail<T>(String name) {
    calls.add(name);
    return Future<T>.error(error);
  }

  @override
  Future<void> like(int postId) => _fail('like');
  @override
  Future<void> unlike(int postId) => _fail('unlike');
  @override
  Future<void> rekarot(int postId) => _fail('rekarot');
  @override
  Future<void> unrekarot(int postId) => _fail('unrekarot');
  @override
  Future<void> bookmark(int postId) => _fail('bookmark');
  @override
  Future<void> unbookmark(int postId) => _fail('unbookmark');

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} は使わない');
}

Post _post({
  bool liked = false,
  int likesCount = 0,
  bool rekaroted = false,
  int rekarotsCount = 0,
  bool bookmarked = false,
  int bookmarksCount = 0,
}) => Post.empty().copyWith(
  id: 1,
  author: Author(displayName: 'A', id: 2, username: 'a'),
  liked: liked,
  likesCount: likesCount,
  rekaroted: rekaroted,
  rekarotsCount: rekarotsCount,
  bookmarked: bookmarked,
  bookmarksCount: bookmarksCount,
);

/// [api] を差し込んだコンテナを作り、[post] を初期状態として入れる。
({ProviderContainer container, PostNotifier notifier}) _setUp(
  PostsApi api,
  Post post,
) {
  final container = ProviderContainer(
    overrides: [postsApiProvider.overrideWithValue(api)],
  );
  addTearDown(container.dispose);

  final notifier = container.read(postProvider(post.id).notifier)
    ..initialize(post);
  return (container: container, notifier: notifier);
}

void main() {
  group('通信が失敗したとき', () {
    late _FailingPostsApi api;

    setUp(() => api = _FailingPostsApi(Exception('通信断')));

    test('いいねは押す前の状態に戻る', () async {
      final (:container, :notifier) = _setUp(api, _post(likesCount: 5));

      await expectLater(notifier.toggleLike(), throwsA(isA<Exception>()));

      final state = container.read(postProvider(1));
      expect(state.liked, isFalse, reason: 'いいねが付いたままになっている');
      expect(state.likesCount, 5, reason: '件数が戻っていない');
      expect(api.calls, ['like']);
    });

    test('いいね解除も押す前の状態に戻る', () async {
      final (:container, :notifier) = _setUp(
        api,
        _post(liked: true, likesCount: 5),
      );

      await expectLater(notifier.toggleLike(), throwsA(isA<Exception>()));

      final state = container.read(postProvider(1));
      expect(state.liked, isTrue);
      expect(state.likesCount, 5);
      expect(api.calls, ['unlike']);
    });

    test('リカロートは押す前の状態に戻る', () async {
      final (:container, :notifier) = _setUp(api, _post(rekarotsCount: 3));

      await expectLater(notifier.toggleRekarot(), throwsA(isA<Exception>()));

      final state = container.read(postProvider(1));
      expect(state.rekaroted, isFalse);
      expect(state.rekarotsCount, 3);
    });

    test('ブックマークは押す前の状態に戻る', () async {
      final (:container, :notifier) = _setUp(api, _post(bookmarksCount: 1));

      await expectLater(notifier.toggleBookmark(), throwsA(isA<Exception>()));

      final state = container.read(postProvider(1));
      expect(state.bookmarked, isFalse);
      expect(state.bookmarksCount, 1);
    });
  });

  group('400 が返ったとき', () {
    // 既にいいね済みなど、こちらの状態がずれているだけ。
    // 楽観更新をそのまま活かし、例外も投げない。
    test('楽観更新を保ったまま黙って続ける', () async {
      final api = _FailingPostsApi(
        const KarotterClientException(400, 'already liked'),
      );
      final (:container, :notifier) = _setUp(api, _post(likesCount: 5));

      await notifier.toggleLike();

      final state = container.read(postProvider(1));
      expect(state.liked, isTrue);
      expect(state.likesCount, 6);
    });
  });

  group('通信が成功したとき', () {
    test('楽観更新がそのまま残る', () async {
      final (:container, :notifier) = _setUp(
        _SucceedingPostsApi(),
        _post(likesCount: 5),
      );

      await notifier.toggleLike();

      final state = container.read(postProvider(1));
      expect(state.liked, isTrue);
      expect(state.likesCount, 6);
    });
  });
}

/// 何をしても成功する [PostsApi]。
class _SucceedingPostsApi implements PostsApi {
  @override
  Future<void> like(int postId) async {}
  @override
  Future<void> unlike(int postId) async {}

  @override
  dynamic noSuchMethod(Invocation invocation) =>
      throw UnimplementedError('${invocation.memberName} は使わない');
}

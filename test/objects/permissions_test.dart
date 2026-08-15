// カロートに対して何ができるかの判定。
//
// 規則の出典は Karotter Web の `KaroatCard` チャンク（oo/ro/er/lo/io/nr/lr/tr/sr）。
// バンドルが変わったら `dart run tool/grep_bundle.dart 'canInteract'` で見直す。

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/circle.dart';
import 'package:karotator/objects/permissions.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

const _viewerId = 1;
const _viewerName = 'me';
const _authorId = 2;

Post _post({
  bool canInteract = true,
  bool canQuote = true,
  bool authorIsPrivate = false,
  bool authorIsFollowingByViewer = false,
  PostVisibility visibility = PostVisibility.PUBLIC,
  ReplyRestriction replyRestriction = ReplyRestriction.EVERYONE,
  String content = '本文',
  int authorId = _authorId,
  int? replyCircleId,
  Circle? viewerCircle,
  Poll? poll,
}) => Post.empty().copyWith(
  author: Author.empty().copyWith(
    id: authorId,
    username: 'author',
    isPrivate: authorIsPrivate,
    isFollowingByViewer: authorIsFollowingByViewer,
  ),
  content: content,
  canInteract: canInteract,
  canQuote: canQuote,
  visibility: visibility,
  replyRestriction: replyRestriction,
  replyCircleId: replyCircleId,
  viewerCircle: viewerCircle,
  poll: poll,
);

PostPermissions _of(Post post, {int? viewerId = _viewerId}) =>
    PostPermissions.of(post, viewerId: viewerId, viewerUsername: _viewerName);

void main() {
  group('canInteract', () {
    test('既定では全部できる', () {
      final p = _of(_post());
      expect(p.canReply, isTrue);
      expect(p.canRekarot, isTrue);
      expect(p.canQuote, isTrue);
      expect(p.canLike, isTrue);
      expect(p.canReact, isTrue);
    });

    test('false なら返信・いいね・リアクション・リカロートが全部止まる', () {
      final p = _of(_post(canInteract: false));
      expect(p.canReply, isFalse);
      expect(p.canLike, isFalse);
      expect(p.canReact, isFalse);
      expect(p.canRekarot, isFalse);
      expect(p.likeDisabledReason, contains('ブロック'));
    });

    test('canQuote だけ false なら引用だけ止まる', () {
      final p = _of(_post(canQuote: false));
      expect(p.canQuote, isFalse);
      expect(p.canRekarot, isTrue);
      expect(p.canLike, isTrue);
    });
  });

  group('リカロートと引用の追加条件', () {
    test('非公開アカウントのカロートはリカロートも引用もできない', () {
      final p = _of(_post(authorIsPrivate: true));
      expect(p.canRekarot, isFalse);
      expect(p.canQuote, isFalse);
      expect(p.rekarotDisabledReason, contains('非公開'));
    });

    test('サークル限定も同じ', () {
      final p = _of(_post(visibility: PostVisibility.CIRCLE));
      expect(p.canRekarot, isFalse);
      expect(p.canQuote, isFalse);
    });

    test('自分のカロートなら非公開でもサークル限定でも通る', () {
      // Web も `|| er` で上書きしている。
      final p = _of(
        _post(
          authorId: _viewerId,
          authorIsPrivate: true,
          visibility: PostVisibility.CIRCLE,
        ),
      );
      expect(p.isOwn, isTrue);
      expect(p.canRekarot, isTrue);
      expect(p.canQuote, isTrue);
    });

    test('フォロワー限定はリカロートを止めない', () {
      // Web は uo を計算しているが tr / sr には使っていない。
      final p = _of(_post(visibility: PostVisibility.FOLLOWERS));
      expect(p.canRekarot, isTrue);
    });
  });

  group('返信制限', () {
    test('FOLLOWING はフォローされていれば通る', () {
      expect(
        _of(
          _post(
            replyRestriction: ReplyRestriction.FOLLOWING,
            authorIsFollowingByViewer: true,
          ),
        ).canReply,
        isTrue,
      );
      expect(
        _of(_post(replyRestriction: ReplyRestriction.FOLLOWING)).canReply,
        isFalse,
      );
    });

    test('MENTIONED は本文に自分が単語として出ていれば通る', () {
      expect(
        _of(
          _post(
            replyRestriction: ReplyRestriction.MENTIONED,
            content: 'やあ @me どう？',
          ),
        ).canReply,
        isTrue,
      );
    });

    test('MENTIONED は前方一致では通らない', () {
      // @me は @meow に一致してはいけない。
      expect(
        _of(
          _post(
            replyRestriction: ReplyRestriction.MENTIONED,
            content: 'やあ @meow どう？',
          ),
        ).canReply,
        isFalse,
      );
    });

    test('CIRCLE は閲覧者のサークルが一致すれば通る', () {
      expect(
        _of(
          _post(
            replyRestriction: ReplyRestriction.CIRCLE,
            replyCircleId: 7,
            viewerCircle: const Circle(
              id: 7,
              ownerId: _authorId,
              name: 'なかま',
              meta: CircleCountMeta(posts: 0, stories: 0),
            ),
          ),
        ).canReply,
        isTrue,
      );
      expect(
        _of(
          _post(replyRestriction: ReplyRestriction.CIRCLE, replyCircleId: 7),
        ).canReply,
        isFalse,
      );
    });

    test('自分のカロートには制限にかかわらず返信できる', () {
      final p = _of(
        _post(
          authorId: _viewerId,
          replyRestriction: ReplyRestriction.MENTIONED,
          content: '誰にも触れていない本文',
        ),
      );
      expect(p.canReply, isTrue);
    });

    test('知らない制限は通す', () {
      // 増えた値で返信欄が消えるより、押してサーバーに弾かれる方がまし。
      expect(
        _of(_post(replyRestriction: ReplyRestriction.UNKNOWN)).canReply,
        isTrue,
      );
    });

    test('canInteract が false なら制限を満たしていても返信できない', () {
      final p = _of(
        _post(
          canInteract: false,
          replyRestriction: ReplyRestriction.MENTIONED,
          content: 'やあ @me',
        ),
      );
      expect(p.canReply, isFalse);
      expect(p.replyDisabledReason, contains('ブロック'));
    });
  });

  group('投票', () {
    Poll poll({bool expired = false}) => Poll(
      id: 1,
      expiresAt: DateTime(2030),
      isExpired: expired,
      totalVotes: 0,
      options: const [],
    );

    test('終了した投票には入れられない', () {
      expect(_of(_post(poll: poll(expired: true))).canVote, isFalse);
    });

    test('canInteract が false なら入れられない', () {
      expect(_of(_post(canInteract: false, poll: poll())).canVote, isFalse);
    });

    test('自分の投票でも入れられる（作者では止めない）', () {
      // Web は canInteract と isExpired だけで分けている。
      expect(_of(_post(authorId: _viewerId, poll: poll())).canVote, isTrue);
    });
  });

  group('未ログイン', () {
    test('自分のカロート扱いにはならない', () {
      final p = _of(_post(authorId: _viewerId), viewerId: null);
      expect(p.isOwn, isFalse);
    });
  });
}

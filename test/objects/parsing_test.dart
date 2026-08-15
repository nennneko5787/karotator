// モデルが「知らない値」や「足りないフィールド」で落ちないことを確かめる。
//
// Karotter 側は予告なく列挙値を増やす。1 つ増えただけで $enumDecode が投げ、
// そのレスポンス全体（タイムライン丸ごと）が表示できなくなる事故が実際にあった。
// 仕様: specs/002-response-models/requirements.md REQ-MODEL-001..004

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/enum.dart';
import 'package:karotator/objects/post.dart';
import 'package:karotator/objects/user.dart';

/// 必須フィールドだけを埋めた最小のカロート。
Map<String, Object?> minimalPost({Map<String, Object?> overrides = const {}}) => {
  'id': 1,
  'content': 'テスト',
  'author': {'id': 2, 'username': 'alice', 'displayName': 'Alice'},
  'createdAt': '2026-04-12T12:34:56.789Z',
  'bookmarked': false,
  'bookmarksCount': 0,
  'isAiGenerated': false,
  'isPromotional': false,
  'likesCount': 0,
  'repliesCount': 0,
  'viewsCount': 0,
  'mediaAlts': <String>[],
  'mediaR18Flags': <bool>[],
  'mediaSpoilerFlags': <bool>[],
  'mediaTypes': <String>[],
  'mediaUrls': <String>[],
  ...overrides,
};

void main() {
  group('OfficialMark', () {
    test('配列で受け取れる', () {
      final author = Author.fromJson({
        'id': 1,
        'username': 'a',
        'displayName': 'A',
        'officialMark': ['BLUE', 'PURPLE'],
      });
      expect(author.officialMark, [OfficialMark.BLUE, OfficialMark.PURPLE]);
    });

    test('単一の文字列でも受け取れる', () {
      // Web クライアントも `Array.isArray(e) ? e : e ? [e] : []` で両対応している。
      final author = Author.fromJson({
        'id': 1,
        'username': 'a',
        'displayName': 'A',
        'officialMark': 'GRAY',
      });
      expect(author.officialMark, [OfficialMark.GRAY]);
    });

    test('知らない値は落とす（例外にしない）', () {
      final author = Author.fromJson({
        'id': 1,
        'username': 'a',
        'displayName': 'A',
        'officialMark': ['BLUE', 'RAINBOW_SPARKLE'],
      });
      expect(author.officialMark, [OfficialMark.BLUE]);
    });

    test('NONE と重複は落とす', () {
      final author = Author.fromJson({
        'id': 1,
        'username': 'a',
        'displayName': 'A',
        'officialMark': ['NONE', 'RED', 'RED'],
      });
      expect(author.officialMark, [OfficialMark.RED]);
    });

    test('null でも空でも落ちない', () {
      for (final value in [null, <String>[], '']) {
        final author = Author.fromJson({
          'id': 1,
          'username': 'a',
          'displayName': 'A',
          'officialMark': value,
        });
        expect(author.officialMark, isEmpty, reason: '$value');
      }
    });
  });

  group('列挙の未知の値', () {
    test('公開範囲が FOLLOWERS でも読める', () {
      final post = Post.fromJson(
        minimalPost(overrides: {'visibility': 'FOLLOWERS'}),
      );
      expect(post.visibility, PostVisibility.FOLLOWERS);
    });

    test('知らない公開範囲は UNKNOWN になる（例外にしない）', () {
      final post = Post.fromJson(
        minimalPost(overrides: {'visibility': 'SOMETHING_NEW'}),
      );
      expect(post.visibility, PostVisibility.UNKNOWN);
    });

    test('知らない返信制限は UNKNOWN になる', () {
      final post = Post.fromJson(
        minimalPost(overrides: {'replyRestriction': 'SOMETHING_NEW'}),
      );
      expect(post.replyRestriction, ReplyRestriction.UNKNOWN);
    });
  });

  group('足りないフィールド', () {
    test('省略されたフィールドは既定値になる', () {
      final post = Post.fromJson(minimalPost());
      expect(post.isR18, isFalse);
      expect(post.hideFromMinors, isFalse);
      expect(post.hashtags, isEmpty);
      expect(post.reactions, isEmpty);
      expect(post.visibility, PostVisibility.PUBLIC);
      expect(post.minimumAge, isNull);
      expect(post.expiresAt, isNull);
    });

    test('返信先は user だけでも読める', () {
      final post = Post.fromJson(
        minimalPost(
          overrides: {
            'replyTargets': [
              {
                'user': {'id': 9, 'username': 'bob', 'displayName': 'Bob'},
              },
            ],
          },
        ),
      );
      expect(post.replyTargets.single.user.username, 'bob');
      expect(post.replyTargets.single.source, '');
    });
  });

  group('運営の強制設定', () {
    test('本人が R18 にしていなくても運営指定なら R18 扱い', () {
      final post = Post.fromJson(
        minimalPost(overrides: {'isR18': false, 'adminForceR18': true}),
      );
      expect(post.isR18, isFalse);
      expect(post.effectiveR18, isTrue);
    });

    test('本人指定だけでも R18 扱い', () {
      final post = Post.fromJson(minimalPost(overrides: {'isR18': true}));
      expect(post.effectiveR18, isTrue);
    });

    test('Bot / パロディも同じように合成される', () {
      final author = Author.fromJson({
        'id': 1,
        'username': 'a',
        'displayName': 'A',
        'isBotAccount': false,
        'adminForceBot': true,
      });
      expect(author.effectiveBot, isTrue);
      expect(author.effectiveParody, isFalse);
    });
  });

  group('表示できないカロート', () {
    // 実際に観測した引用元。author も createdAt も来ない。
    // 仕様: specs/003-hidden-posts/requirements.md
    const hiddenQuote = {
      'id': 1764682,
      'parentId': null,
      'quotedPostId': null,
      'authorId': 81,
      'author': null,
      'replyToUsers': <Object?>[],
      'canView': false,
      'hiddenReason': 'FILTERED',
      'hiddenFilterDetail': 'MINOR_RESTRICTED',
    };

    test('非表示の引用元を含むカロートが読める', () {
      // これが落ちるとタイムラインのレスポンス丸ごとが読めなくなる。
      final post = Post.fromJson(
        minimalPost(
          overrides: {'quotedPostId': 1764682, 'quotedPost': hiddenQuote},
        ),
      );

      final quote = post.quote;
      expect(quote, isA<HiddenPost>());
      quote as HiddenPost;
      expect(quote.id, 1764682);
      expect(quote.authorId, 81);
      expect(quote.hiddenReason, HiddenReason.FILTERED);
      expect(quote.hiddenFilterDetail, HiddenFilterDetail.MINOR_RESTRICTED);
      expect(quote.hiddenRelationDetail, HiddenRelationDetail.UNKNOWN);
    });

    test('見える引用元は QuotedPost になる', () {
      final post = Post.fromJson(
        minimalPost(
          overrides: {
            'quotedPost': {
              'id': 5,
              'content': 'やあ',
              'author': {'id': 2, 'username': 'bob', 'displayName': 'Bob'},
              'createdAt': '2026-04-12T12:34:56.789Z',
              'canView': true,
            },
          },
        ),
      );
      expect(post.quote, isA<QuotedPost>());
      expect((post.quote! as QuotedPost).content, 'やあ');
    });

    test('知らない理由コードは UNKNOWN になる', () {
      final hidden = HiddenPost.fromJson({
        'id': 1,
        'canView': false,
        'hiddenReason': 'SOMETHING_NEW',
        'hiddenFilterDetail': 'ALSO_NEW',
        'hiddenRelationDetail': 'ALSO_NEW',
      });
      expect(hidden.hiddenReason, HiddenReason.UNKNOWN);
      expect(hidden.hiddenFilterDetail, HiddenFilterDetail.UNKNOWN);
      expect(hidden.hiddenRelationDetail, HiddenRelationDetail.UNKNOWN);
    });

    test('理由コードのキーが無くても UNKNOWN になる', () {
      // @Default はキーが無いときにしか効かない。unknownEnumValue と両方要る。
      final hidden = HiddenPost.fromJson({'id': 1, 'canView': false});
      expect(hidden.hiddenReason, HiddenReason.UNKNOWN);
      expect(hidden.hiddenFilterDetail, HiddenFilterDetail.UNKNOWN);
    });

    test('author が null なだけでも非表示として読む', () {
      // canView を返さない経路への保険。
      final post = Post.fromJson(
        minimalPost(
          overrides: {
            'quotedPost': {'id': 7, 'author': null},
          },
        ),
      );
      expect(post.quote, isA<HiddenPost>());
    });

    test('quotedPostId だけなら NOT_FOUND を合成する', () {
      final post = Post.fromJson(
        minimalPost(overrides: {'quotedPostId': 99, 'quotedPost': null}),
      );
      final quote = post.quote;
      expect(quote, isA<HiddenPost>());
      quote as HiddenPost;
      expect(quote.id, 99);
      expect(quote.hiddenFilterDetail, HiddenFilterDetail.NOT_FOUND);
    });

    test('引用がなければ quote は null', () {
      expect(Post.fromJson(minimalPost()).quote, isNull);
    });

    test('単体取得も非表示スタブになりうる', () {
      expect(postResultFromJson(hiddenQuote), isA<HiddenPost>());
      expect(postResultFromJson(minimalPost()), isA<Post>());
    });

    group('canReveal', () {
      HiddenPost relation(HiddenRelationDetail detail) => HiddenPost(
        id: 1,
        hiddenReason: HiddenReason.RELATION,
        hiddenRelationDetail: detail,
      );

      test('自分でミュート / ブロックしたものは開ける', () {
        expect(relation(HiddenRelationDetail.MUTED).canReveal, isTrue);
        expect(relation(HiddenRelationDetail.BLOCKED).canReveal, isTrue);
      });

      test('相手にブロックされている場合は開けない', () {
        expect(
          relation(HiddenRelationDetail.BLOCKED_BY_AUTHOR).canReveal,
          isFalse,
        );
      });

      test('フィルタによる非表示は開けない', () {
        final hidden = HiddenPost(
          id: 1,
          hiddenReason: HiddenReason.FILTERED,
          hiddenFilterDetail: HiddenFilterDetail.MINOR_RESTRICTED,
        );
        expect(hidden.canReveal, isFalse);
      });
    });
  });

  group('検索結果のスネークケース', () {
    test('is_following などを読める', () {
      final author = Author.fromJson({
        'id': 1,
        'username': 'a',
        'displayName': 'A',
        'is_following': true,
        'is_followed_by': true,
        'follow_request_sent': false,
      });
      expect(author.isFollowing, isTrue);
      expect(author.isFollowedBy, isTrue);
      expect(author.followRequestSent, isFalse);
    });
  });
}

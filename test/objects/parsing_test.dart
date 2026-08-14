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

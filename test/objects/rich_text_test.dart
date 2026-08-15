// 本文の記法とカスタムリアクション。
//
// 仕様: specs/005-rich-text/design.md §7
// 記法の出典は Karotter Web の PostRichText / proReactions チャンク。

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/objects/pro_reactions.dart';
import 'package:karotator/objects/rich_text.dart';
import 'package:karotator/objects/subscription.dart';

/// 素の文字だけを繋げて返す。壊れた入力が消えていないかの確認に使う。
String plainOf(List<RichToken> tokens) => tokens
    .map(
      (t) => switch (t) {
        TextToken(:final text) => text,
        UrlToken(:final raw) => raw,
        MentionToken(:final raw) => raw,
        HashtagToken(:final raw) => raw,
        RubyToken(:final base, :final reading) => '$base《$reading》',
        SpoilerToken(:final children) => plainOf(children),
      },
    )
    .join();

void main() {
  group('ルビ', () {
    test('｜ で base を明示できる', () {
      final tokens = parseRichText('これは｜漢字《かんじ》です');
      final ruby = tokens.whereType<RubyToken>().single;
      expect(ruby.base, '漢字');
      expect(ruby.reading, 'かんじ');
      expect(plainOf(tokens), 'これは漢字《かんじ》です');
    });

    test('半角 | でも効く', () {
      final ruby = parseRichText('|漢字《かんじ》').whereType<RubyToken>().single;
      expect(ruby.base, '漢字');
    });

    test('省略形は直前の塊が base になる', () {
      final ruby = parseRichText('漢字《かんじ》').whereType<RubyToken>().single;
      expect(ruby.base, '漢字');
      expect(ruby.reading, 'かんじ');
    });

    test('閉じていない《 は素の文字のまま', () {
      // 壊れていても本文は出す (REQ-RICH-017)。
      final tokens = parseRichText('漢字《かんじ');
      expect(tokens.whereType<RubyToken>(), isEmpty);
      expect(plainOf(tokens), '漢字《かんじ');
    });
  });

  group('伏せ字', () {
    test('|| で挟むと隠す', () {
      final tokens = parseRichText('答えは||42||です');
      expect(tokens.whereType<SpoilerToken>().length, 1);
      expect(plainOf(tokens), '答えは42です');
    });

    test('中身の URL も解釈する', () {
      // 伏せ字の中もトークン化する (REQ-RICH-012)。
      final spoiler = parseRichText(
        '||https://example.com を見て||',
      ).whereType<SpoilerToken>().single;
      expect(spoiler.children.whereType<UrlToken>().single.raw,
          'https://example.com');
    });

    test('中身のルビも解釈する', () {
      final spoiler = parseRichText(
        '||｜犯人《はんにん》は執事||',
      ).whereType<SpoilerToken>().single;
      expect(spoiler.children.whereType<RubyToken>().single.base, '犯人');
    });

    test('片方だけの || は素の文字', () {
      final tokens = parseRichText('これは||隠れない');
      expect(tokens.whereType<SpoilerToken>(), isEmpty);
      expect(plainOf(tokens), 'これは||隠れない');
    });
  });

  group('URL', () {
    test('https:// を拾う', () {
      final url = parseRichText(
        'ここ https://example.com/a?b=1 です',
      ).whereType<UrlToken>().single;
      expect(url.raw, 'https://example.com/a?b=1');
      expect(url.url, 'https://example.com/a?b=1');
    });

    test('www. 始まりも拾い、開くときに https:// を足す', () {
      // 以前は取りこぼしていた (REQ-RICH-013)。
      final url = parseRichText('www.example.com へ').whereType<UrlToken>().single;
      expect(url.raw, 'www.example.com');
      expect(url.url, 'https://www.example.com');
    });

    test('末尾の句読点は URL に含めない', () {
      final url = parseRichText(
        'https://example.com/a, つづき',
      ).whereType<UrlToken>().single;
      expect(url.raw, 'https://example.com/a');
    });
  });

  group('メンションとハッシュタグ', () {
    test('@ID を拾う', () {
      final mention = parseRichText(
        'やあ @alice さん',
      ).whereType<MentionToken>().single;
      expect(mention.username, 'alice');
    });

    test('#タグを拾う', () {
      final tag = parseRichText('#にんじん が好き').whereType<HashtagToken>().single;
      expect(tag.raw, '#にんじん');
    });
  });

  group('壊れた入力', () {
    test('空文字でも落ちない', () {
      expect(parseRichText(''), isEmpty);
    });

    test('記号だけでも本文が消えない', () {
      for (final source in ['||', '《》', '｜', '@', '#']) {
        expect(plainOf(parseRichText(source)), source, reason: source);
      }
    });

    test('||||| は「| を含む伏せ字」になる', () {
      // Web も `startsWith("||") && endsWith("||") && length >= 4` で
      // 同じ判定をする。`||` は記法なので本文には残らない。
      final tokens = parseRichText('|||||');
      final spoiler = tokens.whereType<SpoilerToken>().single;
      expect(plainOf(spoiler.children), '|');
    });
  });

  group('pro リアクション', () {
    test('観測した識別子を引ける', () {
      final reaction = proReactionOf('pro:otsukaresama');
      expect(reaction, isNotNull);
      expect(reaction!.label, 'おつかれ様');
      expect(reaction.assetUrl, '/reactions/pro/otsukaresama.png');
    });

    test('知らない識別子は null', () {
      // 増えた識別子で落ちない (REQ-RICH-016)。
      expect(proReactionOf('pro:shiranai'), isNull);
      expect(isProReaction('pro:shiranai'), isFalse);
      expect(isProReaction('🎉'), isFalse);
    });

    test('全件が pro: で始まり画像を持つ', () {
      expect(proReactions, isNotEmpty);
      for (final reaction in proReactions) {
        expect(reaction.code, startsWith('pro:'));
        expect(reaction.assetUrl, startsWith('/reactions/pro/'));
        expect(reaction.label, isNotEmpty);
      }
    });
  });

  group('実効プラン', () {
    test('ACTIVE な PRO は PRO', () {
      expect(
        effectiveSubscriptionPlan(plan: 'PRO', status: 'ACTIVE'),
        SubscriptionPlan.PRO,
      );
    });

    test('TRIALING も通す', () {
      expect(
        effectiveSubscriptionPlan(plan: 'PRO', status: 'TRIALING'),
        SubscriptionPlan.PRO,
      );
    });

    test('解約済みは FREE', () {
      expect(
        effectiveSubscriptionPlan(plan: 'PRO', status: 'CANCELED'),
        SubscriptionPlan.FREE,
      );
    });

    test('期限切れは FREE', () {
      expect(
        effectiveSubscriptionPlan(
          plan: 'PRO',
          status: 'ACTIVE',
          activeUntil: DateTime(2020),
          now: DateTime(2026),
        ),
        SubscriptionPlan.FREE,
      );
    });

    test('期限が先なら通す', () {
      expect(
        effectiveSubscriptionPlan(
          plan: 'PRO',
          status: 'ACTIVE',
          activeUntil: DateTime(2030),
          now: DateTime(2026),
        ),
        SubscriptionPlan.PRO,
      );
    });

    test('知らないプラン名は FREE', () {
      expect(
        effectiveSubscriptionPlan(plan: 'ULTRA', status: 'ACTIVE'),
        SubscriptionPlan.FREE,
      );
    });
  });

  group('canAddReaction', () {
    test('通常の絵文字は誰でも付けられる', () {
      expect(canAddReaction('🎉', isPro: false, reacted: false), isTrue);
    });

    test('pro リアクションは PRO だけ', () {
      expect(
        canAddReaction('pro:otsukaresama', isPro: false, reacted: false),
        isFalse,
      );
      expect(
        canAddReaction('pro:otsukaresama', isPro: true, reacted: false),
        isTrue,
      );
    });

    test('自分が付けたものは PRO を切らしても外せる', () {
      // 外す操作も同じ経路を通るため (REQ-RICH-007)。
      expect(
        canAddReaction('pro:otsukaresama', isPro: false, reacted: true),
        isTrue,
      );
    });

    test('既に他人が付けた pro リアクションに乗るのは PRO だけ', () {
      // チップを直接押す経路がここを見ていなかったため、FREE のまま
      // 送信して 403「Proプラン限定のリアクションです」になっていた。
      expect(
        canAddReaction('pro:kusa', isPro: false, reacted: false),
        isFalse,
      );
    });
  });
}

// 本文の Markdown 解析。
//
// 仕様: specs/006-markdown/design.md §9
// widget を組まずにブロックの切り出しだけを確かめる。

import 'package:flutter_test/flutter_test.dart';
import 'package:karotator/objects/post_body.dart';
import 'package:markdown/markdown.dart' as md;

/// ブロックのインラインを平文に戻す。中身が消えていないかの確認に使う。
String textOf(List<md.Node> nodes) =>
    nodes.map((n) => n.textContent).join();

void main() {
  group('見出し', () {
    test('# が h1 になる', () {
      final blocks = parsePostBody('# なんの話ししてたんだ？！');
      final heading = blocks.single as HeadingBlock;
      expect(heading.level, 1);
      expect(textOf(heading.nodes), 'なんの話ししてたんだ？！');
    });

    test('###### まで取れる', () {
      for (var level = 1; level <= 6; level++) {
        final blocks = parsePostBody('${'#' * level} 見出し');
        expect((blocks.single as HeadingBlock).level, level);
      }
    });

    test('####### は見出しにならない', () {
      // 7 個以上は CommonMark の見出しではない。
      expect(parsePostBody('####### 見出し').single, isA<ParagraphBlock>());
    });

    test('#にんじん は見出しにならない', () {
      // ハッシュタグと衝突させない (REQ-MD-010)。
      // 見出しは `#` の後ろに空白が要る。
      final block = parsePostBody('#にんじん が好き').single;
      expect(block, isA<ParagraphBlock>());
      expect(textOf((block as ParagraphBlock).nodes), '#にんじん が好き');
    });
  });

  group('-# 小さい文字', () {
    test('subtext が立ち、記号が本文に残らない', () {
      final block = parsePostBody('-# ちいさい').single as ParagraphBlock;
      expect(block.subtext, isTrue);
      expect(textOf(block.nodes), 'ちいさい');
    });

    test('箇条書きとして解釈されない', () {
      // `-` の直後に空白が無いのでリストにならない。
      final block = parsePostBody('-# ちいさい').single;
      expect(block, isA<ParagraphBlock>());
    });

    test('普通の段落は subtext にならない', () {
      final block = parsePostBody('ふつうの文').single as ParagraphBlock;
      expect(block.subtext, isFalse);
    });

    test('行の途中の -# は効かない', () {
      final block = parsePostBody('これは -# ちいさくない').single as ParagraphBlock;
      expect(block.subtext, isFalse);
    });
  });

  group('箇条書き', () {
    test('- は順序なし', () {
      final list = parsePostBody('- あ\n- い').single as ListBlock;
      expect(list.ordered, isFalse);
      expect(list.items.length, 2);
      expect(textOf((list.items.first.single as ParagraphBlock).nodes), 'あ');
    });

    test('1. は順序あり', () {
      final list = parsePostBody('1. あ\n2. い').single as ListBlock;
      expect(list.ordered, isTrue);
      expect(list.items.length, 2);
    });
  });

  group('コード', () {
    test('言語を取れる', () {
      final block =
          parsePostBody('```dart\nvoid main() {}\n```').single as CodeBlock;
      expect(block.language, 'dart');
      expect(block.code, 'void main() {}');
    });

    test('言語が無ければ null', () {
      final block = parsePostBody('```\nplain\n```').single as CodeBlock;
      expect(block.language, isNull);
      expect(block.code, 'plain');
    });

    test('閉じていなくても落ちない', () {
      // 壊れた記法でも本文を出し続ける (REQ-MD-012)。
      expect(() => parsePostBody('```dart\nvoid main() {}'), returnsNormally);
      expect(parsePostBody('```dart\nvoid main() {}'), isNotEmpty);
    });
  });

  group('引用', () {
    test('> が引用になる', () {
      final quote = parsePostBody('> ひとこと').single as BlockQuoteBlock;
      expect(quote.children.length, 1);
      expect(
        textOf((quote.children.single as ParagraphBlock).nodes),
        'ひとこと',
      );
    });
  });

  group('表', () {
    test('見出しと行が取れる', () {
      final table =
          parsePostBody('| a | b |\n| --- | --- |\n| 1 | 2 |').single
              as TableBlock;
      expect(table.header.length, 2);
      expect(table.rows.length, 1);
      expect(table.rows.single.length, 2);
      expect(textOf(table.rows.single.first), '1');
    });
  });

  group('壊れた入力', () {
    test('空文字は空のリスト', () {
      expect(parsePostBody(''), isEmpty);
      expect(parsePostBody('   \n  '), isEmpty);
    });

    test('閉じていない ** でも文字が消えない', () {
      final block = parsePostBody('**とじてない').single as ParagraphBlock;
      expect(textOf(block.nodes), contains('とじてない'));
    });

    test('記号だけでも例外にならない', () {
      for (final source in ['#', '-', '>', '|', '```', '***']) {
        expect(() => parsePostBody(source), returnsNormally, reason: source);
      }
    });
  });

  group('強調とリンク', () {
    test('** が strong になる', () {
      final block = parsePostBody('**つよい**').single as ParagraphBlock;
      final strong = block.nodes.single as md.Element;
      expect(strong.tag, 'strong');
      expect(strong.textContent, 'つよい');
    });

    test('~~ が del になる', () {
      final block = parsePostBody('~~けす~~').single as ParagraphBlock;
      expect((block.nodes.single as md.Element).tag, 'del');
    });

    test('裸の URL は Markdown が触らない', () {
      // URL の持ち主は 005 のトークナイザ (REQ-MD-009)。Markdown 側でも
      // 拾うと二重になるし、`www.` の扱いが 005 側にしか無い。
      final block =
          parsePostBody('見て https://example.com/a と www.example.com')
              .single as ParagraphBlock;
      expect(block.nodes.whereType<md.Element>(), isEmpty);
      expect(
        textOf(block.nodes),
        '見て https://example.com/a と www.example.com',
      );
    });

    test('[文字](URL) が a になる', () {
      final block =
          parsePostBody('[ここ](https://example.com)').single as ParagraphBlock;
      final link = block.nodes.single as md.Element;
      expect(link.tag, 'a');
      expect(link.attributes['href'], 'https://example.com');
      expect(link.textContent, 'ここ');
    });
  });
}

library;

import 'package:markdown/markdown.dart' as md;

/// 本文のブロック 1 つ。
sealed class PostBlock {
  const PostBlock();
}

class ParagraphBlock extends PostBlock {
  const ParagraphBlock(this.nodes, {this.subtext = false});

  final List<md.Node> nodes;

  /// `-# ` で始まっていた段落。小さく出す (REQ-MD-007)。
  final bool subtext;
}

class HeadingBlock extends PostBlock {
  const HeadingBlock(this.level, this.nodes);

  /// 1〜6。
  final int level;

  final List<md.Node> nodes;
}

class BlockQuoteBlock extends PostBlock {
  const BlockQuoteBlock(this.children);
  final List<PostBlock> children;
}

class ListBlock extends PostBlock {
  const ListBlock({required this.ordered, required this.items});

  final bool ordered;

  /// 項目ごとのブロック。入れ子になりうる。
  final List<List<PostBlock>> items;
}

class CodeBlock extends PostBlock {
  const CodeBlock(this.code, {this.language});

  final String code;

  /// ``` の後ろに書かれた言語。無ければ null (REQ-MD-016)。
  final String? language;
}

class TableBlock extends PostBlock {
  const TableBlock({required this.header, required this.rows});

  final List<List<md.Node>> header;
  final List<List<List<md.Node>>> rows;
}

class RuleBlock extends PostBlock {
  const RuleBlock();
}

/// `-# ` で始まる段落は小さく出す。Karotter の独自記法。
const _subtextPrefix = '-# ';

/// GFM から**自動リンクだけ**外したもの。
///
/// 裸の URL の持ち主は 005 のトークナイザ (REQ-MD-009)。両方が拾うと二重に
/// なるし、`www.` の扱い（表示はそのまま、開くときに `https://` を足す）は
/// 005 側にしか無い。`[文字](URL)` は Markdown が扱う。
///
/// 基底が `gitHubWeb` ではないのは、あちらが `remark-gfm` に無いもの
/// （`:smile:` の置換・`> [!NOTE]`・見出しへの `id`）まで足すため。
final _extensionSet = md.ExtensionSet(
  md.ExtensionSet.gitHubFlavored.blockSyntaxes,
  md.ExtensionSet.gitHubFlavored.inlineSyntaxes
      .where((syntax) => syntax is! md.AutolinkExtensionSyntax)
      .toList(growable: false),
);

/// 本文をブロックに分ける。
///
/// 記法が壊れていても例外を投げない。`markdown` は不正な記法を素の文字として
/// 残すので、そのまま段落になる (REQ-MD-012)。
List<PostBlock> parsePostBody(String source) {
  if (source.trim().isEmpty) return const [];

  final document = md.Document(
    // 表・打ち消しが要る。裸の URL は 005 に任せる。
    extensionSet: _extensionSet,
    // 生の HTML は解釈せず、素の文字として残す（非目標）。`true` にすると
    // `R&D` が `R&amp;D` のまま画面に出てしまう。
    encodeHtml: false,
  );

  final nodes = document.parse(source);
  return _blocks(nodes);
}

List<PostBlock> _blocks(List<md.Node> nodes) {
  final blocks = <PostBlock>[];
  for (final node in nodes) {
    final block = _block(node);
    if (block != null) blocks.add(block);
  }
  return blocks;
}

PostBlock? _block(md.Node node) {
  if (node is md.Text) {
    // ブロックの位置に素のテキストが来ることがある（空白など）。
    return node.text.trim().isEmpty ? null : ParagraphBlock([node]);
  }
  if (node is! md.Element) return null;

  switch (node.tag) {
    case 'p':
      return _paragraph(node.children ?? const []);

    case 'h1' || 'h2' || 'h3' || 'h4' || 'h5' || 'h6':
      final level = int.tryParse(node.tag.substring(1)) ?? 1;
      return HeadingBlock(level, node.children ?? const []);

    case 'blockquote':
      return BlockQuoteBlock(_blocks(node.children ?? const []));

    case 'ul' || 'ol':
      return ListBlock(
        ordered: node.tag == 'ol',
        items: [
          for (final item in node.children ?? const <md.Node>[])
            if (item is md.Element && item.tag == 'li')
              _listItem(item.children ?? const []),
        ],
      );

    case 'pre':
      return _codeBlock(node);

    case 'table':
      return _table(node);

    case 'hr':
      return const RuleBlock();

    default:
      // 知らない要素でも中身の文字は残す (REQ-MD-013)。
      return ParagraphBlock(node.children ?? const []);
  }
}

/// 段落。先頭が `-# ` なら剥がして小さい段落にする (REQ-MD-007)。
///
/// Karotter Web もテキストノードの先頭 3 文字を見て同じことをしている。
ParagraphBlock _paragraph(List<md.Node> children) {
  final first = children.firstOrNull;
  if (first is! md.Text || !first.text.startsWith(_subtextPrefix)) {
    return ParagraphBlock(children);
  }

  return ParagraphBlock([
    md.Text(first.text.substring(_subtextPrefix.length)),
    ...children.skip(1),
  ], subtext: true);
}

/// 箇条書きの項目。`markdown` は中身が 1 段落だけだと `<p>` を省くので、
/// 素のインラインが直接ぶら下がることがある。
List<PostBlock> _listItem(List<md.Node> children) {
  final blocks = <PostBlock>[];
  final inline = <md.Node>[];

  void flushInline() {
    if (inline.isEmpty) return;
    blocks.add(_paragraph(List.of(inline)));
    inline.clear();
  }

  for (final child in children) {
    if (child is md.Element && _isBlockTag(child.tag)) {
      flushInline();
      final block = _block(child);
      if (block != null) blocks.add(block);
    } else {
      inline.add(child);
    }
  }
  flushInline();
  return blocks;
}

bool _isBlockTag(String tag) => const {
  'p',
  'h1',
  'h2',
  'h3',
  'h4',
  'h5',
  'h6',
  'blockquote',
  'ul',
  'ol',
  'pre',
  'table',
  'hr',
}.contains(tag);

/// ` ```dart ` は `<pre><code class="language-dart">` になる。
CodeBlock _codeBlock(md.Element pre) {
  final code = pre.children?.firstOrNull;
  if (code is! md.Element) {
    return CodeBlock(pre.textContent);
  }

  final classes = code.attributes['class'] ?? '';
  final match = RegExp(r'language-([A-Za-z0-9_+-]+)').firstMatch(classes);

  // 末尾の改行は `markdown` が足すもの。表示には要らない。
  var text = code.textContent;
  if (text.endsWith('\n')) text = text.substring(0, text.length - 1);

  return CodeBlock(text, language: match?.group(1));
}

TableBlock _table(md.Element table) {
  final header = <List<md.Node>>[];
  final rows = <List<List<md.Node>>>[];

  for (final section in table.children ?? const <md.Node>[]) {
    if (section is! md.Element) continue;
    for (final row in section.children ?? const <md.Node>[]) {
      if (row is! md.Element || row.tag != 'tr') continue;

      final cells = [
        for (final cell in row.children ?? const <md.Node>[])
          if (cell is md.Element) cell.children ?? const <md.Node>[],
      ];
      if (section.tag == 'thead') {
        header.addAll(cells);
      } else {
        rows.add(cells);
      }
    }
  }

  return TableBlock(header: header, rows: rows);
}

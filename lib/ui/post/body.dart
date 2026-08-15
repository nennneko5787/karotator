import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_highlighting/flutter_highlighting.dart";
import "package:flutter_highlighting/themes/github.dart";
import "package:flutter_highlighting/themes/github-dark.dart";
import "package:highlighting/languages/all.dart";
import "package:karotator/objects/post_body.dart";
import "package:karotator/ui/metrics.dart";
import "package:karotator/ui/text_agent.dart";
import "package:karotator/utils.dart";
import "package:markdown/markdown.dart" as md;

/// カロート本文。Markdown を解いてブロックごとに描く。
///
/// 素のテキストには 005 のトークナイザ（URL・メンション・ハッシュタグ・
/// ルビ・伏せ字）が掛かる。**引用元やプレビューでは使わない**。あちらは
/// Markdown を解かず [TextAgent] だけを通す（Karotter Web の `lightweight`）。
///
/// 仕様: specs/006-markdown/design.md §4
class PostBody extends StatelessWidget {
  const PostBody({super.key, required this.content, this.style});

  final String content;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final metrics = PostMetrics.of(context);
    final base = (style ?? TextStyle(fontSize: metrics.fontSize)).copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );

    final blocks = parsePostBody(content);
    if (blocks.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        for (final block in blocks)
          _BlockView(block: block, base: base, metrics: metrics),
      ],
    );
  }
}

class _BlockView extends StatelessWidget {
  const _BlockView({
    required this.block,
    required this.base,
    required this.metrics,
  });

  final PostBlock block;
  final TextStyle base;
  final PostMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final body = base.fontSize ?? metrics.fontSize;

    return switch (block) {
      ParagraphBlock(:final nodes, :final subtext) => Text.rich(
        _inline(
          context,
          nodes,
          subtext
              ? base.copyWith(
                  fontSize: metrics.subtextSize(body),
                  color: Theme.of(context).secondaryHeaderColor,
                )
              : base,
        ),
      ),

      HeadingBlock(:final level, :final nodes) => Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text.rich(
          _inline(
            context,
            nodes,
            base.copyWith(
              fontSize: metrics.headingSize(body, level),
              fontWeight: FontWeight.w700,
              height: 1.3,
            ),
          ),
        ),
      ),

      BlockQuoteBlock(:final children) => _Quote(
        children: children,
        base: base,
        metrics: metrics,
      ),

      ListBlock(:final ordered, :final items) => _List(
        ordered: ordered,
        items: items,
        base: base,
        metrics: metrics,
      ),

      CodeBlock(:final code, :final language) => _Code(
        code: code,
        language: language,
        size: metrics.codeSize(body),
      ),

      TableBlock(:final header, :final rows) => _Table(
        header: header,
        rows: rows,
        base: base,
        metrics: metrics,
      ),

      RuleBlock() => const Divider(),
    };
  }

  /// インラインを組む。素のテキストは 005 のトークナイザへ回す。
  InlineSpan _inline(
    BuildContext context,
    List<md.Node> nodes,
    TextStyle style,
  ) => TextSpan(
    children: [for (final node in nodes) _node(context, node, style)],
  );

  InlineSpan _node(BuildContext context, md.Node node, TextStyle style) {
    if (node is md.Text) {
      // ここで URL・メンション・ルビ・伏せ字が効く (REQ-MD-009)。
      return TextAgent.generate(node.textContent, context, style: style);
    }
    if (node is! md.Element) {
      return TextSpan(text: node.textContent, style: style);
    }

    final children = node.children ?? const <md.Node>[];

    switch (node.tag) {
      case 'strong':
        return _inline(context, children, style.copyWith(
          fontWeight: FontWeight.w700,
        ));
      case 'em':
        return _inline(context, children, style.copyWith(
          fontStyle: FontStyle.italic,
        ));
      case 'del':
        return _inline(context, children, style.copyWith(
          decoration: TextDecoration.lineThrough,
        ));
      case 'u':
        return _inline(context, children, style.copyWith(
          decoration: TextDecoration.underline,
        ));

      case 'code':
        // **中身にトークナイザを掛けない。** `#tag` や `||x||` が
        // 勝手に解釈されると困る。
        return TextSpan(
          text: node.textContent,
          style: style.copyWith(
            fontFamily: "monospace",
            fontFamilyFallback: const ["Courier New", "monospace"],
            backgroundColor: Theme.of(
              context,
            ).colorScheme.onSurface.withValues(alpha: 0.08),
          ),
        );

      case 'a':
        final href = node.attributes['href'];
        final linkStyle = style.copyWith(color: const Color(0xFF1D9BF0));
        if (href == null || href.isEmpty) {
          return _inline(context, children, linkStyle);
        }
        return TextSpan(
          children: [_inline(context, children, linkStyle)],
          recognizer: TapGestureRecognizer()..onTap = () => openURL(href),
        );

      case 'br':
        return const TextSpan(text: "\n");

      default:
        // 知らない要素でも中身を落とさない (REQ-MD-013)。
        return _inline(context, children, style);
    }
  }
}

/// 引用。左に縦線を引いて字下げする。
class _Quote extends StatelessWidget {
  const _Quote({
    required this.children,
    required this.base,
    required this.metrics,
  });

  final List<PostBlock> children;
  final TextStyle base;
  final PostMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: Theme.of(context).dividerColor, width: 3),
        ),
      ),
      padding: EdgeInsets.only(left: 10 * metrics.scale),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 6,
        children: [
          for (final block in children)
            _BlockView(block: block, base: base, metrics: metrics),
        ],
      ),
    );
  }
}

/// 箇条書きと番号付き。中身は入れ子になりうる。
class _List extends StatelessWidget {
  const _List({
    required this.ordered,
    required this.items,
    required this.base,
    required this.metrics,
  });

  final bool ordered;
  final List<List<PostBlock>> items;
  final TextStyle base;
  final PostMetrics metrics;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        for (final (index, item) in items.indexed)
          Padding(
            padding: EdgeInsets.only(left: 4 * metrics.scale),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: [
                Text(ordered ? "${index + 1}." : "・", style: base),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 4,
                    children: [
                      for (final block in item)
                        _BlockView(
                          block: block,
                          base: base,
                          metrics: metrics,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// コードブロック。横に長いことがあるので、ここだけ横に送れる。
class _Code extends StatelessWidget {
  const _Code({required this.code, required this.language, required this.size});

  final String code;
  final String? language;
  final double size;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // 知らない言語や指定無しは色分けしない (REQ-MD-016)。
    final id = language != null && allLanguages.containsKey(language)
        ? language!
        : "plaintext";

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: HighlightView(
          code,
          languageId: id,
          theme: isDark ? githubDarkTheme : githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: TextStyle(
            fontFamily: "monospace",
            fontFamilyFallback: const ["Courier New", "monospace"],
            fontSize: size,
          ),
        ),
      ),
    );
  }
}

/// 表。画面に収まらないときは**表だけ**横に送れる (REQ-MD-017)。
class _Table extends StatelessWidget {
  const _Table({
    required this.header,
    required this.rows,
    required this.base,
    required this.metrics,
  });

  final List<List<md.Node>> header;
  final List<List<List<md.Node>>> rows;
  final TextStyle base;
  final PostMetrics metrics;

  @override
  Widget build(BuildContext context) {
    final lineColor = Theme.of(context).dividerColor;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        headingRowHeight: 36 * metrics.scale,
        dataRowMinHeight: 32 * metrics.scale,
        dataRowMaxHeight: 64 * metrics.scale,
        border: TableBorder.all(color: lineColor),
        columns: [
          for (final cell in header)
            DataColumn(
              label: Text.rich(
                _cell(context, cell, base.copyWith(
                  fontWeight: FontWeight.w700,
                )),
              ),
            ),
        ],
        rows: [
          for (final row in rows)
            DataRow(
              cells: [
                for (final cell in row)
                  DataCell(Text.rich(_cell(context, cell, base))),
              ],
            ),
        ],
      ),
    );
  }

  InlineSpan _cell(BuildContext context, List<md.Node> nodes, TextStyle style) =>
      _BlockView(
        block: ParagraphBlock(nodes),
        base: style,
        metrics: metrics,
      )._inline(context, nodes, style);
}

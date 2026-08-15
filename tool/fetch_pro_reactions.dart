// pro リアクション（カスタム絵文字）の一覧を Karotter Web の JS から取り出す。
//
//   dart run tool/fetch_pro_reactions.dart
//
// 一覧を返す API は無い。識別子・日本語名・画像のパスは `proReactions`
// チャンクにしか入っていない。`fetch_legal_documents.dart` と同じ事情。
//
// 出力:
//   lib/objects/pro_reactions.dart   アプリが読む一覧
//   specs/api/pro-reactions.md       人が読む一覧
//
// 仕様: specs/005-rich-text/design.md §1 (REQ-RICH-014, 015)
// pub 依存を持たない。Flutter SDK 同梱の dart だけで動く。

import 'dart:io';

import 'src/bundle.dart';
import 'src/js_literal.dart';

/// `proReactions` チャンクの配列。`[{code:"pro:arigato",slug:"arigatou",...}]`。
final _catalogStart = RegExp(r'=(\[\{code:"pro:[a-z0-9]+",slug:")');

Future<void> main(List<String> args) async {
  final origin = option(args, '--origin') ?? defaultOrigin;

  stderr.writeln('origin: $origin');
  final bundle = await fetchBundle(origin: origin, log: stderr.writeln);
  stderr.writeln('chunks: ${bundle.length}');

  final reactions = _findCatalog(bundle);
  if (reactions == null) {
    stderr.writeln(
      'pro リアクションの一覧が見つからない。'
      'proReactions チャンクの構造が変わった可能性がある。',
    );
    exitCode = 1;
    return;
  }
  stderr.writeln('reactions: ${reactions.length}');

  await File('lib/objects/pro_reactions.dart').writeAsString(_dart(reactions));
  await File('specs/api/pro-reactions.md').writeAsString(_markdown(reactions));
  stderr.writeln(
    'wrote lib/objects/pro_reactions.dart, specs/api/pro-reactions.md',
  );
}

class _Reaction {
  _Reaction(this.code, this.slug, this.label, this.labelEn, this.assetUrl);

  final String code;
  final String slug;
  final String label;
  final String labelEn;
  final String assetUrl;
}

List<_Reaction>? _findCatalog(Bundle bundle) {
  for (final entry in bundle.entries) {
    final match = _catalogStart.firstMatch(entry.value);
    if (match == null) continue;

    final List<Object?> raw;
    try {
      raw = parseJsArray(entry.value, match.start + 1);
    } on JsLiteralException catch (e) {
      stderr.writeln('  ${entry.key} の配列を読めない: $e');
      continue;
    }

    final reactions = <_Reaction>[];
    for (final item in raw) {
      if (item is! Map<String, Object?>) continue;
      final code = item['code'];
      final assetUrl = item['assetUrl'];
      if (code is! String || assetUrl is! String) continue;

      reactions.add(
        _Reaction(
          code,
          item['slug'] as String? ?? '',
          item['label'] as String? ?? code,
          item['labelEn'] as String? ?? '',
          assetUrl,
        ),
      );
    }
    if (reactions.isNotEmpty) {
      stderr.writeln('  found in ${entry.key}');
      return reactions;
    }
  }
  return null;
}

String _escape(String value) =>
    value.replaceAll(r'\', r'\\').replaceAll("'", r"\'").replaceAll('\$', r'\$');

String _dart(List<_Reaction> reactions) {
  final buffer = StringBuffer()
    ..writeln('// このファイルは自動生成される。手で編集しない。')
    ..writeln('// 再生成: dart run tool/fetch_pro_reactions.dart')
    ..writeln('//')
    ..writeln('// 出典: https://karotter.com のバンドル内 proReactions チャンク。')
    ..writeln('// 一覧を返す API が無いため埋め込んでいる。')
    ..writeln('//')
    ..writeln('// 仕様: specs/005-rich-text/requirements.md')
    ..writeln()
    ..writeln('/// PRO プラン限定のカスタムリアクション 1 件。')
    ..writeln('class ProReaction {')
    ..writeln('  const ProReaction({')
    ..writeln('    required this.code,')
    ..writeln('    required this.slug,')
    ..writeln('    required this.label,')
    ..writeln('    required this.labelEn,')
    ..writeln('    required this.assetUrl,')
    ..writeln('  });')
    ..writeln()
    ..writeln('  /// `ReactionSummary.emoji` に入る識別子。`pro:otsukaresama` の形。')
    ..writeln('  final String code;')
    ..writeln()
    ..writeln('  final String slug;')
    ..writeln()
    ..writeln('  /// 画面に出す名前。')
    ..writeln('  final String label;')
    ..writeln()
    ..writeln('  final String labelEn;')
    ..writeln()
    ..writeln('  /// Karotter Web のホスト基準の相対パス。`karotterUrl()` で絶対化する。')
    ..writeln('  final String assetUrl;')
    ..writeln('}')
    ..writeln()
    ..writeln('/// 全 ${reactions.length} 件。')
    ..writeln('const proReactions = <ProReaction>[');

  for (final r in reactions) {
    buffer
      ..writeln('  ProReaction(')
      ..writeln("    code: '${_escape(r.code)}',")
      ..writeln("    slug: '${_escape(r.slug)}',")
      ..writeln("    label: '${_escape(r.label)}',")
      ..writeln("    labelEn: '${_escape(r.labelEn)}',")
      ..writeln("    assetUrl: '${_escape(r.assetUrl)}',")
      ..writeln('  ),');
  }

  buffer
    ..writeln('];')
    ..writeln()
    ..writeln('/// 識別子で引くための索引。')
    ..writeln('///')
    ..writeln('/// リアクションはタイムラインの全カロートで描かれるので、')
    ..writeln('/// 毎回 ${reactions.length} 件を線形に探さない。')
    ..writeln(
      'final _byCode = {for (final r in proReactions) r.code: r};',
    )
    ..writeln()
    ..writeln('/// 知らない識別子なら null。')
    ..writeln('ProReaction? proReactionOf(String code) => _byCode[code];')
    ..writeln()
    ..writeln('/// pro リアクションの識別子か。')
    ..writeln('bool isProReaction(String code) => _byCode.containsKey(code);');

  return buffer.toString();
}

String _markdown(List<_Reaction> reactions) {
  final buffer = StringBuffer()
    ..writeln('# pro リアクション')
    ..writeln()
    ..writeln('> このファイルは自動生成される。手で編集しない。')
    ..writeln('> 再生成: `dart run tool/fetch_pro_reactions.dart`')
    ..writeln()
    ..writeln('PRO プラン限定のカスタムリアクション。全 ${reactions.length} 件。')
    ..writeln('`ReactionSummary.emoji` に `code` がそのまま入る。')
    ..writeln()
    ..writeln('画像は Karotter Web のホスト基準。一覧を返す API は無く、')
    ..writeln('`proReactions` チャンクに埋め込まれている。')
    ..writeln()
    ..writeln('| code | 名前 | English | 画像 |')
    ..writeln('| --- | --- | --- | --- |');

  for (final r in reactions) {
    buffer.writeln(
      '| `${r.code}` | ${r.label} | ${r.labelEn} | `${r.assetUrl}` |',
    );
  }

  return buffer.toString();
}

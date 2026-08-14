// Karotter Web クライアントの JS から API エンドポイント一覧を機械抽出する。
//
//   dart run tool/fetch_api_spec.dart
//   dart run tool/fetch_api_spec.dart --origin https://karotter.jp --out specs/api
//
// 仕様: specs/001-api-client/design.md §7 (REQ-API-027..029)
// pub 依存を持たない。Flutter SDK 同梱の dart だけで動く。
//
// 抽出はヒューリスティックであり、完全でも正確でもない。
// 動的に組み立てられたパスは取り逃すし、HTTP でない .get() を拾う可能性もある。
// 生成物は参考資料であって契約ではない。

import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'src/bundle.dart';

/// `.get("/path")` / `` .post(`/path/${id}`) `` 形式の呼び出し。
final _apiCall = RegExp(
  r'''\.(get|post|put|patch|delete)\(\s*(`[^`]*`|"[^"]*"|'[^']*')''',
);

/// 呼び出し直後の `{params:{ ... }}` からクエリキーを拾う。
final _paramsBlock = RegExp(r'\{\s*params\s*:\s*\{');
final _paramKey = RegExp(r'''([A-Za-z_$][A-Za-z0-9_$]*|"[^"]+"|'[^']+')\s*:''');

/// テンプレートリテラルの `${...}` をパスパラメータとして正規化する。
final _interpolation = RegExp(r'\$\{[^}]*\}');

class Endpoint {
  Endpoint(this.method, this.path);

  final String method;
  final String path;
  final Set<String> params = SplayTreeSet<String>();
  final Set<String> chunks = SplayTreeSet<String>();

  String get key => '$method $path';

  /// 第 1 パスセグメント。`/posts/{}/like` なら `posts`。
  String get category {
    final parts = path.split('/').where((e) => e.isNotEmpty);
    return parts.isEmpty ? '(root)' : parts.first;
  }

  Map<String, Object?> toJson() => {
    'method': method,
    'path': path,
    if (params.isNotEmpty) 'query': params.toList(),
    'chunks': chunks.toList(),
  };
}

Future<void> main(List<String> args) async {
  final origin = option(args, '--origin') ?? defaultOrigin;
  final outDir = Directory(option(args, '--out') ?? 'specs/api');

  stderr.writeln('origin: $origin');
  final sources = await fetchBundle(origin: origin, log: stderr.writeln);
  stderr.writeln('chunks: ${sources.length}');

  final endpoints = _extract(sources);
  stderr.writeln('endpoints: ${endpoints.length}');

  await outDir.create(recursive: true);
  await _writeJson(outDir, origin, endpoints);
  await _writeMarkdown(outDir, origin, endpoints);
  stderr.writeln('wrote ${outDir.path}/endpoints.json, endpoints.md');
}

Map<String, Endpoint> _extract(Bundle sources) {
  final found = SplayTreeMap<String, Endpoint>();

  for (final entry in sources.entries) {
    final chunk = entry.key;
    final source = entry.value;

    for (final m in _apiCall.allMatches(source)) {
      final raw = m.group(2)!;
      final literal = raw.substring(1, raw.length - 1);
      // パスに見えないものは HTTP 呼び出しではない (Map.get など)。
      if (!literal.startsWith('/')) continue;

      final method = m.group(1)!.toUpperCase();
      // クエリ付きで直書きされている場合はパスとクエリに割る。
      final questionMark = literal.indexOf('?');
      final pathPart = questionMark < 0
          ? literal
          : literal.substring(0, questionMark);
      final path = pathPart.replaceAll(_interpolation, '{}');

      final endpoint = found.putIfAbsent(
        '$method $path',
        () => Endpoint(method, path),
      );
      endpoint.chunks.add(chunk);
      if (questionMark >= 0) {
        endpoint.params.addAll(_inlineQueryKeys(literal.substring(questionMark + 1)));
      }
      endpoint.params.addAll(_optionsQueryKeys(source, m.end));
    }
  }
  return found;
}

/// `?page=1&limit=20` のような直書きクエリからキー名を拾う。
Iterable<String> _inlineQueryKeys(String query) sync* {
  for (final pair in query.split('&')) {
    final eq = pair.indexOf('=');
    final key = eq < 0 ? pair : pair.substring(0, eq);
    if (key.isNotEmpty) yield key.replaceAll(_interpolation, '{}');
  }
}

/// 呼び出し直後の `{params:{ ... }}` からクエリキーを拾う。
///
/// 波括弧の対応を数えて params オブジェクトの範囲を決め、その最も浅い階層の
/// キーだけを返す。ネストした三項演算子やスプレッドが混ざるので完全ではない。
Iterable<String> _optionsQueryKeys(String source, int callEnd) {
  // 呼び出し直後の狭い範囲にしか現れない。広く見ると無関係な params を拾う。
  final window = source.substring(
    callEnd,
    (callEnd + 400).clamp(0, source.length),
  );
  final head = _paramsBlock.firstMatch(window);
  if (head == null) return const [];

  var depth = 1;
  var end = head.end;
  while (end < window.length && depth > 0) {
    final c = window[end];
    if (c == '{') depth++;
    if (c == '}') depth--;
    end++;
  }
  if (depth != 0) return const [];

  final body = window.substring(head.end, end - 1);
  final keys = <String>{};
  for (final m in _paramKey.allMatches(body)) {
    // 対象の位置までの波括弧の深さを数え、最上位のキーだけ採る。
    if (_depthAt(body, m.start) != 0) continue;
    final raw = m.group(1)!;
    final key = raw.startsWith('"') || raw.startsWith("'")
        ? raw.substring(1, raw.length - 1)
        : raw;
    keys.add(key);
  }
  return keys;
}

int _depthAt(String s, int index) {
  var depth = 0;
  for (var i = 0; i < index; i++) {
    if (s[i] == '{') depth++;
    if (s[i] == '}') depth--;
  }
  return depth;
}

Future<void> _writeJson(
  Directory outDir,
  String origin,
  Map<String, Endpoint> endpoints,
) async {
  final payload = {
    'origin': origin,
    'generatedBy': 'tool/fetch_api_spec.dart',
    'note':
        'JS バンドルからのヒューリスティックな抽出結果。公式ドキュメントではない。',
    'count': endpoints.length,
    'endpoints': endpoints.values.map((e) => e.toJson()).toList(),
  };
  await File('${outDir.path}/endpoints.json').writeAsString(
    '${const JsonEncoder.withIndent('  ').convert(payload)}\n',
  );
}

Future<void> _writeMarkdown(
  Directory outDir,
  String origin,
  Map<String, Endpoint> endpoints,
) async {
  final byCategory = SplayTreeMap<String, List<Endpoint>>();
  for (final e in endpoints.values) {
    byCategory.putIfAbsent(e.category, () => []).add(e);
  }

  final buffer = StringBuffer()
    ..writeln('# Karotter API エンドポイント一覧')
    ..writeln()
    ..writeln('<!-- このファイルは自動生成される。手で編集しない。 -->')
    ..writeln('<!-- 再生成: dart run tool/fetch_api_spec.dart -->')
    ..writeln()
    ..writeln('出典: `$origin` の JS バンドル（`tool/fetch_api_spec.dart` による抽出）。')
    ..writeln('全 **${endpoints.length}** 件 / ${byCategory.length} カテゴリ。')
    ..writeln()
    ..writeln('パスは `<APIホスト>/api` からの相対。`{}` はパスパラメータ。')
    ..writeln('規約（認証・CSRF・ページネーション）は [conventions.md](conventions.md) を参照。')
    ..writeln()
    ..writeln('> [!WARNING]')
    ..writeln('> ミニファイされた JS からのヒューリスティックな抽出であり、網羅性も正確性も保証しない。')
    ..writeln('> 動的に組み立てられたパスは含まれない。クエリ欄は観測できた範囲。')
    ..writeln()
    ..writeln('## カテゴリ')
    ..writeln();

  for (final entry in byCategory.entries) {
    buffer.writeln(
      '- [`/${entry.key}`](#${entry.key}) — ${entry.value.length} 件',
    );
  }

  for (final entry in byCategory.entries) {
    buffer
      ..writeln()
      ..writeln('## ${entry.key}')
      ..writeln()
      ..writeln('| Method | Path | Query |')
      ..writeln('| --- | --- | --- |');
    final sorted = entry.value
      ..sort((a, b) => a.path.compareTo(b.path) != 0
          ? a.path.compareTo(b.path)
          : a.method.compareTo(b.method));
    for (final e in sorted) {
      final query = e.params.isEmpty
          ? ''
          : e.params.map((p) => '`$p`').join(', ');
      buffer.writeln('| `${e.method}` | `${e.path}` | $query |');
    }
  }

  await File('${outDir.path}/endpoints.md').writeAsString(buffer.toString());
}

// Karotter が配信している「開発者向け API ドキュメント」を specs へ書き出す。
//
//   dart run tool/fetch_api_docs.dart
//   dart run tool/fetch_api_docs.dart --origin https://karotter.jp --out specs/api
//
// karotter.com の api-docs チャンクには、Karotter 自身が書いた API 仕様が
// JS の配列リテラルとしてそのまま入っている。method / path / 説明 / パラメータの
// 型と必須フラグ / レスポンス形状まで揃っており、`fetch_api_spec.dart` が
// 抽出する「観測結果」と違って**一次情報**として扱える。
//
// ただし対象は開発者 API（APIキー / Bot トークン / OAuth）であり、
// アプリ本体が使う内部 API とは完全には一致しない。§注意 を参照。
//
// 出力:
//   specs/api/developer-api.md   全セクションの一覧表
//   specs/api/schemas/*.json     レスポンススキーマの実物

import 'dart:convert';
import 'dart:io';

import 'src/bundle.dart';
import 'src/js_literal.dart';

/// ドキュメントのカタログ。`[{id:"auth",title:"認証",...}]` の形をしている。
final _catalogStart = RegExp(r'=(\[\{id:"[A-Za-z0-9_-]+",title:")');

Future<void> main(List<String> args) async {
  final origin = option(args, '--origin') ?? defaultOrigin;
  final outDir = Directory(option(args, '--out') ?? 'specs/api');

  stderr.writeln('origin: $origin');
  final bundle = await fetchBundle(origin: origin, log: stderr.writeln);
  stderr.writeln('chunks: ${bundle.length}');

  final catalog = _findCatalog(bundle);
  if (catalog == null) {
    stderr.writeln(
      'ドキュメントのカタログが見つからない。'
      'api-docs チャンクの構造が変わった可能性がある。',
    );
    exitCode = 1;
    return;
  }

  final sections = catalog.sections;
  final endpointCount = sections.fold<int>(
    0,
    (sum, s) => sum + s.endpoints.length,
  );
  stderr.writeln(
    'catalog: ${catalog.chunk} — ${sections.length} sections / '
    '$endpointCount endpoints',
  );

  await outDir.create(recursive: true);
  await _writeMarkdown(outDir, origin, catalog);
  final schemas = await _writeSchemas(outDir, sections);
  stderr.writeln('wrote ${outDir.path}/developer-api.md');
  stderr.writeln('wrote ${schemas.length} schema(s) to ${outDir.path}/schemas/');
}

// ---- 抽出 ----

class Catalog {
  Catalog(this.chunk, this.sections);

  final String chunk;
  final List<Section> sections;
}

class Section {
  Section(this.id, this.title, this.description, this.endpoints);

  final String id;
  final String title;
  final String description;
  final List<Endpoint> endpoints;

  static Section? tryFrom(Object? raw) {
    if (raw is! Map<String, Object?>) return null;
    final id = raw['id'];
    final endpoints = raw['endpoints'];
    if (id is! String || endpoints is! List) return null;

    return Section(
      id,
      raw['title'] as String? ?? id,
      raw['description'] as String? ?? '',
      [for (final e in endpoints) ?Endpoint.tryFrom(e)],
    );
  }
}

class Endpoint {
  Endpoint({
    required this.method,
    required this.path,
    required this.description,
    required this.auth,
    required this.params,
    required this.body,
    required this.response,
  });

  final String method;
  final String path;
  final String description;
  final String? auth;
  final List<Param> params;
  final List<Param> body;
  final String? response;

  static Endpoint? tryFrom(Object? raw) {
    if (raw is! Map<String, Object?>) return null;
    final method = raw['method'];
    final path = raw['path'];
    if (method is! String || path is! String) return null;

    return Endpoint(
      method: method,
      path: path,
      description: raw['description'] as String? ?? '',
      auth: raw['auth'] as String?,
      params: Param.listFrom(raw['params']),
      body: Param.listFrom(raw['body']),
      response: raw['response'] as String?,
    );
  }
}

class Param {
  Param(this.name, this.type, this.required, this.description);

  final String name;
  final String type;
  final bool required;
  final String description;

  static List<Param> listFrom(Object? raw) {
    if (raw is! List) return const [];
    return [
      for (final e in raw)
        if (e is Map<String, Object?> && e['name'] is String)
          Param(
            e['name']! as String,
            e['type'] as String? ?? '',
            e['required'] == true,
            e['description'] as String? ?? '',
          ),
    ];
  }
}

/// 全チャンクから、いちばん大きなカタログを探す。
///
/// 同じ形のリテラルが複数あっても、エンドポイント数が最多のものを採る。
Catalog? _findCatalog(Bundle bundle) {
  Catalog? best;
  var bestCount = 0;

  for (final entry in bundle.entries) {
    for (final m in _catalogStart.allMatches(entry.value)) {
      final List<Object?> raw;
      try {
        raw = parseJsArray(entry.value, m.start + 1);
      } on JsLiteralException {
        // データではない別のリテラル。読めないものは黙って飛ばす。
        continue;
      }

      final sections = [for (final s in raw) ?Section.tryFrom(s)];
      final count = sections.fold<int>(0, (sum, s) => sum + s.endpoints.length);
      if (count > bestCount) {
        bestCount = count;
        best = Catalog(entry.key, sections);
      }
    }
  }
  return best;
}

// ---- 出力 ----

Future<List<String>> _writeSchemas(
  Directory outDir,
  List<Section> sections,
) async {
  final dir = Directory('${outDir.path}/schemas');
  await dir.create(recursive: true);

  final written = <String>[];
  for (final section in sections) {
    for (final endpoint in section.endpoints) {
      if (!endpoint.path.startsWith('/schemas/')) continue;
      final body = endpoint.response;
      if (body == null) continue;

      final name = endpoint.path.split('/').last;
      // ドキュメントの例は JSON として読めるはず。読めなければそのまま置く。
      final file = File('${dir.path}/$name.json');
      try {
        final decoded = jsonDecode(body);
        await file.writeAsString(
          '${const JsonEncoder.withIndent('  ').convert(decoded)}\n',
        );
      } on FormatException {
        await file.writeAsString('$body\n');
        stderr.writeln('  warn: $name は JSON として読めなかった');
      }
      written.add(name);
    }
  }
  return written;
}

Future<void> _writeMarkdown(
  Directory outDir,
  String origin,
  Catalog catalog,
) async {
  final buffer = StringBuffer()
    ..writeln('# Karotter 開発者 API ドキュメント')
    ..writeln()
    ..writeln('<!-- このファイルは自動生成される。手で編集しない。 -->')
    ..writeln('<!-- 再生成: dart run tool/fetch_api_docs.dart -->')
    ..writeln()
    ..writeln(
      '出典: `$origin` のバンドル内 `${catalog.chunk}` に含まれる '
      'Karotter 自身のドキュメント。',
    )
    ..writeln()
    ..writeln('> [!IMPORTANT]')
    ..writeln('> これは **開発者 API**（APIキー / Bot トークン / OAuth）の仕様であり、')
    ..writeln('> karotator が使っている**内部 API とは一致しない**。')
    ..writeln('> パスの接頭辞も異なる（開発者 API は `/v1` 相当、内部 API は `/api`）。')
    ..writeln('>')
    ..writeln('> 内部 API の観測結果は [endpoints.md](endpoints.md)、')
    ..writeln('> 共通規約は [conventions.md](conventions.md) を参照。')
    ..writeln('>')
    ..writeln('> ただし **レスポンススキーマ**（[schemas/](schemas/)）は両者でほぼ共通で、')
    ..writeln('> karotator のモデルを直す際の一次情報として使える。')
    ..writeln()
    ..writeln('## 目次')
    ..writeln();

  for (final section in catalog.sections) {
    buffer.writeln(
      '- [${section.title}](#${section.id}) '
      '— ${section.endpoints.length} 件',
    );
  }

  for (final section in catalog.sections) {
    buffer
      ..writeln()
      ..writeln('## ${section.title}')
      ..writeln()
      ..writeln('<a id="${section.id}"></a>')
      ..writeln();
    if (section.description.isNotEmpty) {
      buffer
        ..writeln(section.description)
        ..writeln();
    }

    for (final endpoint in section.endpoints) {
      buffer
        ..writeln('### `${endpoint.method}` `${endpoint.path}`')
        ..writeln();
      if (endpoint.description.isNotEmpty) {
        buffer
          ..writeln(endpoint.description)
          ..writeln();
      }
      if (endpoint.auth case final auth? when auth.isNotEmpty) {
        buffer
          ..writeln('認証: `$auth`')
          ..writeln();
      }
      _writeParams(buffer, 'クエリ / パスパラメータ', endpoint.params);
      _writeParams(buffer, 'リクエストボディ', endpoint.body);

      if (endpoint.response case final response? when response.isNotEmpty) {
        buffer
          ..writeln('レスポンス:')
          ..writeln()
          ..writeln('```json')
          ..writeln(response)
          ..writeln('```')
          ..writeln();
      }
    }
  }

  await File('${outDir.path}/developer-api.md').writeAsString(buffer.toString());
}

void _writeParams(StringBuffer buffer, String title, List<Param> params) {
  if (params.isEmpty) return;

  buffer
    ..writeln('$title:')
    ..writeln()
    ..writeln('| 名前 | 型 | 必須 | 説明 |')
    ..writeln('| --- | --- | --- | --- |');
  for (final p in params) {
    buffer.writeln(
      '| `${p.name}` | ${p.type.isEmpty ? '' : '`${p.type}`'} '
      '| ${p.required ? '○' : ''} | ${p.description} |',
    );
  }
  buffer.writeln();
}

// 規約・ポリシーの一覧を Karotter Web の JS から取り出し、Dart として書き出す。
//
//   dart run tool/fetch_legal_documents.dart
//
// 一覧そのものを返す API は無い。どんな文書があるか、どの順で並べるか、
// 日本語と英語のタイトルと説明は `legalLinks` チャンクにしか入っていない。
// 一方で**本文**は `GET /legal/{id}?locale=ja` から取れる（認証不要）。
//
// そこでこのツールは
//   1. バンドルから一覧（パス・タイトル・説明）を読む
//   2. 各ルートのチャンクから `documentId` を拾ってパスと突き合わせる
//   3. 実際に API を叩いて本文が取れる ID かを確かめる
//   4. lib/objects/legal_documents.dart を生成する
//
// 出力:
//   lib/objects/legal_documents.dart   アプリが読む一覧
//   specs/api/legal-documents.md       人が読む一覧

import 'dart:io';

import 'src/bundle.dart';
import 'src/js_literal.dart';

const _apiBase = 'https://api.karotter.com/api';

/// `legalLinks` チャンクの一覧。`[{to:"/terms",titleJa:"利用規約",...}]`。
final _catalogStart = RegExp(r'=(\[\{to:"/[a-z-]+",titleJa:")');

/// 各ルートのチャンクに埋まっている `documentId:"terms"`。
final _documentId = RegExp(r'documentId:"([A-Za-z0-9_-]+)"');

/// チャンクに埋め込まれた日本語の本文。API に本文が無い文書の保険。
final _rawJa = RegExp(r'rawJa:\s*"');

Future<void> main(List<String> args) async {
  final origin = option(args, '--origin') ?? defaultOrigin;

  stderr.writeln('origin: $origin');
  final bundle = await fetchBundle(origin: origin, log: stderr.writeln);
  stderr.writeln('chunks: ${bundle.length}');

  final entries = _findCatalog(bundle);
  if (entries == null) {
    stderr.writeln(
      '規約の一覧が見つからない。legalLinks チャンクの構造が変わった可能性がある。',
    );
    exitCode = 1;
    return;
  }
  stderr.writeln('documents: ${entries.length}');

  final ids = _documentIdsByPath(bundle);
  final docs = <_Document>[];

  for (final entry in entries) {
    final path = entry['to'] as String;
    final id = ids[path];
    if (id == null) {
      stderr.writeln('  skip $path — documentId が見つからない');
      continue;
    }

    final available = await _probe(id);
    // API に本文が無いものだけ、バンドルに埋まっている本文を写す。
    final fallback = available ? null : _fallbackBody(bundle, path);

    stderr.writeln(
      '  ${available ? 'api ' : (fallback != null ? 'bndl' : 'web ')} '
      '$path -> $id'
      '${fallback != null ? ' (${fallback.length} 文字を同梱)' : ''}',
    );
    docs.add(
      _Document(
        id: id,
        path: path,
        titleJa: entry['titleJa'] as String? ?? '',
        titleEn: entry['titleEn'] as String? ?? '',
        descriptionJa: entry['descriptionJa'] as String? ?? '',
        descriptionEn: entry['descriptionEn'] as String? ?? '',
        apiAvailable: available,
        fallbackBody: fallback,
      ),
    );
  }

  await _writeDart(docs, origin);
  await _writeMarkdown(docs, origin);
  stderr.writeln('wrote lib/objects/legal_documents.dart');
  stderr.writeln('wrote specs/api/legal-documents.md');
}

class _Document {
  _Document({
    required this.id,
    required this.path,
    required this.titleJa,
    required this.titleEn,
    required this.descriptionJa,
    required this.descriptionEn,
    required this.apiAvailable,
    required this.fallbackBody,
  });

  final String id;
  final String path;
  final String titleJa;
  final String titleEn;
  final String descriptionJa;
  final String descriptionEn;
  final bool apiAvailable;
  final String? fallbackBody;
}

/// ルートのチャンクから `rawJa:"..."` を取り出す。
///
/// Karotter Web は API が落ちていても読めるよう本文をバンドルに埋めている。
/// API が本文を返さない文書はこれを写しておく。
String? _fallbackBody(Bundle bundle, String path) {
  final name = path.substring(1);

  for (final entry in bundle.entries) {
    final base = entry.key.replaceFirst(RegExp(r'-[A-Za-z0-9_-]{8}\.js$'), '');
    if (base != name) continue;

    final m = _rawJa.firstMatch(entry.value);
    if (m == null) return null;
    try {
      // 開きクォートの位置から読む。
      final value = parseJsLiteral(entry.value, m.end - 1).value;
      return value is String && value.trim().isNotEmpty ? value : null;
    } on JsLiteralException {
      return null;
    }
  }
  return null;
}

List<Map<String, Object?>>? _findCatalog(Bundle bundle) {
  for (final source in bundle.values) {
    final m = _catalogStart.firstMatch(source);
    if (m == null) continue;

    try {
      final raw = parseJsArray(source, m.start + 1);
      return [
        for (final e in raw)
          if (e is Map<String, Object?> && e['to'] is String) e,
      ];
    } on JsLiteralException {
      continue;
    }
  }
  return null;
}

/// ルートのパスと `documentId` を、チャンク名で突き合わせる。
///
/// `/ai-policy` の本文は `ai-policy-<hash>.js` に入っている、という命名規則に
/// 頼っている。命名が変わったらここが空になる。
Map<String, String> _documentIdsByPath(Bundle bundle) {
  final byPath = <String, String>{};

  for (final entry in bundle.entries) {
    final name = entry.key.replaceFirst(RegExp(r'-[A-Za-z0-9_-]{8}\.js$'), '');
    final m = _documentId.firstMatch(entry.value);
    if (m == null) continue;
    byPath['/$name'] = m.group(1)!;
  }
  return byPath;
}

/// 本文が API から取れるか確かめる。
Future<bool> _probe(String id) async {
  final client = HttpClient()..userAgent = userAgent;
  try {
    await fetchText(client, '$_apiBase/legal/${Uri.encodeComponent(id)}?locale=ja');
    return true;
  } on HttpFailure {
    return false;
  } finally {
    client.close(force: true);
  }
}

/// Dart のシングルクォート文字列リテラルの中身にする。
String _dartString(String s) => s
    .replaceAll(r'\', r'\\')
    .replaceAll(r'$', r'\$')
    .replaceAll("'", r"\'")
    .replaceAll('\r', r'\r')
    .replaceAll('\n', r'\n');

Future<void> _writeDart(List<_Document> docs, String origin) async {
  String escape(String s) => _dartString(s);

  final buffer = StringBuffer()
    ..writeln('// このファイルは自動生成される。手で編集しない。')
    ..writeln('// 再生成: dart run tool/fetch_legal_documents.dart')
    ..writeln('//')
    ..writeln('// 出典: $origin のバンドル内 legalLinks チャンク。')
    ..writeln('// 一覧を返す API が無いため埋め込んでいる。')
    ..writeln()
    ..writeln("import 'package:karotator/objects/legal.dart';")
    ..writeln()
    ..writeln('/// Karotter が公開している規約・ポリシーの一覧。')
    ..writeln('const legalDocuments = <LegalDocumentRef>[');

  for (final doc in docs) {
    buffer
      ..writeln('  LegalDocumentRef(')
      ..writeln("    id: '${escape(doc.id)}',")
      ..writeln("    path: '${escape(doc.path)}',")
      ..writeln("    titleJa: '${escape(doc.titleJa)}',")
      ..writeln("    titleEn: '${escape(doc.titleEn)}',")
      ..writeln("    descriptionJa: '${escape(doc.descriptionJa)}',")
      ..writeln("    descriptionEn: '${escape(doc.descriptionEn)}',");
    if (!doc.apiAvailable) {
      buffer.writeln('    apiAvailable: false,');
    }
    if (doc.fallbackBody case final body?) {
      // 本文には改行と引用符が入るので raw 文字列は使えない。
      buffer.writeln("    fallbackBody: '${_dartString(body)}',");
    }
    buffer.writeln('  ),');
  }

  buffer.writeln('];');
  await File(
    'lib/objects/legal_documents.dart',
  ).writeAsString(buffer.toString());
}

Future<void> _writeMarkdown(List<_Document> docs, String origin) async {
  final buffer = StringBuffer()
    ..writeln('# 規約・ポリシー一覧')
    ..writeln()
    ..writeln('<!-- このファイルは自動生成される。手で編集しない。 -->')
    ..writeln('<!-- 再生成: dart run tool/fetch_legal_documents.dart -->')
    ..writeln()
    ..writeln('出典: `$origin` のバンドル内 `legalLinks` チャンク。')
    ..writeln('本文は `GET /legal/{id}?locale=ja` から **text/plain** で取れる（認証不要）。')
    ..writeln('更新の有無は `GET /legal/summary` の `version` を')
    ..writeln('`AuthUser.legalNoticeSeenVersion` と比べて判断する。')
    ..writeln()
    ..writeln('| 文書 | `documentId` | Web パス | 本文の入手先 |')
    ..writeln('| --- | --- | --- | --- |');

  for (final doc in docs) {
    final source = doc.apiAvailable
        ? 'API'
        : (doc.fallbackBody != null ? 'バンドル同梱' : 'Web のみ');
    buffer.writeln(
      '| ${doc.titleJa} | `${doc.id}` | `${doc.path}` | $source |',
    );
  }

  buffer
    ..writeln()
    ..writeln('本文の形式:')
    ..writeln()
    ..writeln('```')
    ..writeln('@effectiveDate: 2026-06-27')
    ..writeln('@title: 利用規約')
    ..writeln()
    ..writeln('前文の段落。空行で区切る。')
    ..writeln()
    ..writeln('## 第1条（適用）')
    ..writeln('本文。')
    ..writeln('```')
    ..writeln();

  await File('specs/api/legal-documents.md').writeAsString(buffer.toString());
}

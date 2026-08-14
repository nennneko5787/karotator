// Karotter Web クライアントの JS バンドルを取得する。
//
// `tool/fetch_api_spec.dart` と `tool/fetch_api_docs.dart` が共有する。
// pub 依存を持たない (REQ-API-029)。

import 'dart:convert';
import 'dart:io';

const userAgent =
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 '
    '(KHTML, like Gecko) Chrome/140.0.0.0 Safari/537.36';

const defaultOrigin = 'https://karotter.com';

/// エントリ HTML から読み込まれる module script。
final _entryScript = RegExp(
  r'<script[^>]+type="module"[^>]+src="([^"]+\.js)"',
);

/// チャンク同士の参照。Vite のハッシュ付きファイル名を拾う。
final _chunkRef = RegExp(
  r'''["'`]\.?/?(?:assets/)?([A-Za-z0-9_.$-]+-[A-Za-z0-9_-]{8}\.js)["'`]''',
);

class HttpFailure implements Exception {
  HttpFailure(this.url, this.statusCode);

  final String url;
  final int statusCode;

  @override
  String toString() => 'HttpFailure{$url -> $statusCode}';
}

/// 取得済みのバンドル。キーはチャンクのファイル名、値はソース。
typedef Bundle = Map<String, String>;

/// エントリから参照を辿って全チャンクを幅優先で取得する。
///
/// 実測で 167 チャンク / 4.7MB ほど。ネットワークに出るので数十秒かかる。
Future<Bundle> fetchBundle({
  String origin = defaultOrigin,
  void Function(String message)? log,
}) async {
  final client = HttpClient()..userAgent = userAgent;
  try {
    final html = await fetchText(client, '$origin/');
    final entries = _entryScript
        .allMatches(html)
        .map((m) => _normalizeAssetPath(m.group(1)!))
        .toList();
    if (entries.isEmpty) {
      throw StateError(
        'エントリの <script type="module"> が見つからない。'
        'ビルド構成が変わった可能性がある。',
      );
    }

    final sources = <String, String>{};
    final queue = <String>[...entries];
    final seen = <String>{...entries};

    while (queue.isNotEmpty) {
      final path = queue.removeAt(0);
      final String body;
      try {
        body = await fetchText(client, '$origin$path');
      } on HttpFailure catch (e) {
        log?.call('  skip $path (${e.statusCode})');
        continue;
      }
      sources[path.split('/').last] = body;

      for (final m in _chunkRef.allMatches(body)) {
        final next = '/assets/${m.group(1)!}';
        if (seen.add(next)) queue.add(next);
      }
    }
    return sources;
  } finally {
    client.close(force: true);
  }
}

String _normalizeAssetPath(String src) =>
    src.startsWith('/') ? src : '/${src.replaceFirst(RegExp(r'^\./'), '')}';

Future<String> fetchText(HttpClient client, String url) async {
  final request = await client.getUrl(Uri.parse(url));
  request.headers.set(HttpHeaders.acceptHeader, '*/*');
  final response = await request.close();
  if (response.statusCode != HttpStatus.ok) {
    await response.drain<void>();
    throw HttpFailure(url, response.statusCode);
  }
  return response.transform(utf8.decoder).join();
}

/// コマンドライン引数から `--name value` を取り出す。
String? option(List<String> args, String name) {
  final i = args.indexOf(name);
  if (i < 0 || i + 1 >= args.length) return null;
  return args[i + 1];
}

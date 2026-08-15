// Karotter Web クライアントの JS を正規表現で検索する。
//
//   dart run tool/grep_bundle.dart 'hiddenReason'
//   dart run tool/grep_bundle.dart 'hiddenFilterDetail' --context 800
//   dart run tool/grep_bundle.dart 'MINOR_RESTRICTED' --cache .karotter-bundle
//
// 仕様: specs/003-hidden-posts/design.md §9 (REQ-HIDE-018)
// pub 依存を持たない。Flutter SDK 同梱の dart だけで動く。
//
// バンドルはミニファイされていて 1 チャンクが 1 行になっている。行単位の grep が
// 効かないので、一致箇所の前後を文字数で切り出して出す。
//
// 列挙値の出典を調べるのに使う。`specs/api/` の生成物と違い、出力は保存しない。

import 'dart:io';

import 'src/bundle.dart';

/// `--name value` の value を取り違えないように位置引数だけ拾う。
List<String> _positional(List<String> args) {
  final rest = <String>[];
  for (var i = 0; i < args.length; i++) {
    if (args[i].startsWith('--')) {
      i++; // 次は値なので飛ばす
      continue;
    }
    rest.add(args[i]);
  }
  return rest;
}

Future<void> main(List<String> args) async {
  final patterns = _positional(args);
  if (patterns.length != 1) {
    stderr.writeln(
      'usage: dart run tool/grep_bundle.dart <正規表現> '
      '[--context 400] [--cache <dir>] [--origin https://karotter.com]',
    );
    exitCode = 64;
    return;
  }

  final pattern = RegExp(patterns.single);
  final context = int.tryParse(option(args, '--context') ?? '') ?? 400;
  final origin = option(args, '--origin') ?? defaultOrigin;
  final cacheDir = option(args, '--cache');

  final sources = await _load(origin: origin, cacheDir: cacheDir);
  stderr.writeln('chunks: ${sources.length}');

  var hits = 0;
  for (final entry in _sorted(sources)) {
    for (final m in pattern.allMatches(entry.value)) {
      hits++;
      final start = (m.start - context).clamp(0, entry.value.length);
      final end = (m.end + context).clamp(0, entry.value.length);
      stdout.writeln('===== ${entry.key} @${m.start}');
      stdout.writeln(entry.value.substring(start, end));
      stdout.writeln();
    }
  }
  stderr.writeln('hits: $hits');
  if (hits == 0) exitCode = 1;
}

List<MapEntry<String, String>> _sorted(Bundle sources) =>
    sources.entries.toList()..sort((a, b) => a.key.compareTo(b.key));

/// `--cache` があればそこを使い、無ければ取得する。
///
/// バンドルは実測 167 チャンク / 4.2MB あり、取得に数十秒かかる。同じ調査で
/// 何度も検索するなら残しておく。キャッシュの中身は検証しない。
Future<Bundle> _load({required String origin, String? cacheDir}) async {
  if (cacheDir == null) {
    return fetchBundle(origin: origin, log: stderr.writeln);
  }

  final dir = Directory(cacheDir);
  if (await dir.exists()) {
    final cached = <String, String>{};
    await for (final f in dir.list()) {
      if (f is File && f.path.endsWith('.js')) {
        cached[f.uri.pathSegments.last] = await f.readAsString();
      }
    }
    if (cached.isNotEmpty) {
      stderr.writeln('cache: ${dir.path}');
      return cached;
    }
  }

  final sources = await fetchBundle(origin: origin, log: stderr.writeln);
  await dir.create(recursive: true);
  for (final entry in sources.entries) {
    await File('${dir.path}/${entry.key}').writeAsString(entry.value);
  }
  stderr.writeln('cached to ${dir.path}');
  return sources;
}

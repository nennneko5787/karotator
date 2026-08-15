/// カロート本文の記法を解く。
///
/// widget を組まない純粋な字句解析にしてある。`BuildContext` が要らないので
/// そのまま試験できる（仕様: specs/005-rich-text/design.md §3, §7）。
///
/// 出典は Karotter Web の `PostRichText` チャンク。段取りは 2 段。
///
/// ```
/// 本文 ─① 伏せ字で分割 ─② 中身をトークン化
/// ```
///
/// 伏せ字の中にも URL やルビが入りうるので、①の中身を②に通す。
library;

/// 本文の一部。
sealed class RichToken {
  const RichToken();
}

/// 素の文字。
class TextToken extends RichToken {
  const TextToken(this.text);
  final String text;
}

/// `https://…` や `www.…`。
class UrlToken extends RichToken {
  const UrlToken(this.raw);

  /// 本文に書かれたままの文字列。表示に使う。
  final String raw;

  /// 実際に開く URL。`www.` 始まりには `https://` を足す。
  String get url =>
      RegExp(r'^https?://', caseSensitive: false).hasMatch(raw)
      ? raw
      : 'https://$raw';
}

/// `@someone`。
class MentionToken extends RichToken {
  const MentionToken(this.raw);
  final String raw;

  String get username => raw.substring(1);
}

/// `#タグ`。karotator は検索画面が無いのでリンクにはしない。
class HashtagToken extends RichToken {
  const HashtagToken(this.raw);
  final String raw;
}

/// `漢字《かんじ》` / `｜漢字《かんじ》`。
class RubyToken extends RichToken {
  const RubyToken({required this.base, required this.reading});

  /// 本体。
  final String base;

  /// 読み。
  final String reading;
}

/// `||隠す||` の中身。中身はさらにトークンに分かれている。
class SpoilerToken extends RichToken {
  const SpoilerToken(this.children);
  final List<RichToken> children;
}

/// 伏せ字。`||` で挟む。中身は空でない。
final _spoilerPattern = RegExp(r'\|\|[\s\S]+?\|\|');

/// 空白 / URL / ハッシュタグ / メンション / ルビ。Karotter Web の `Ss` を写した。
final _tokenPattern = RegExp(
  r'\s+'
  r'|(?:https?://|www\.)[^\s<>()]+[^\s.,!?<>()]'
  r'|#[\p{L}\p{N}_]{1,50}'
  r'|@[A-Za-z0-9_]{1,30}'
  r'|(?:[|｜][^《》\n]+|[^\s《》｜|]+)《[^《》\n]+》',
  unicode: true,
);

/// ルビ 1 つ。base は `｜` で明示するか、空白を含まない塊。
final _rubyPattern = RegExp(
  r'^(?:[|｜]([^《》\n]+)|([^\s《》｜|]+))《([^《》\n]+)》$',
  unicode: true,
);

final _urlPattern = RegExp(r'^(?:https?://|www\.)', caseSensitive: false);

/// 本文をトークンに分ける。
///
/// 記法が壊れていても落ちない。閉じていない `《》` や片方だけの `||` は
/// 素の文字として出る (REQ-RICH-017)。
List<RichToken> parseRichText(String source) {
  if (source.isEmpty) return const [];

  final tokens = <RichToken>[];
  var index = 0;

  for (final match in _spoilerPattern.allMatches(source)) {
    if (match.start > index) {
      tokens.addAll(_tokenize(source.substring(index, match.start)));
    }
    // `||` を剥がした中身をもう一段解く (REQ-RICH-012)。
    final inner = match.group(0)!;
    tokens.add(SpoilerToken(_tokenize(inner.substring(2, inner.length - 2))));
    index = match.end;
  }

  if (index < source.length) {
    tokens.addAll(_tokenize(source.substring(index)));
  }
  return tokens;
}

/// 伏せ字を剥がした後の 1 段。
List<RichToken> _tokenize(String source) {
  if (source.isEmpty) return const [];

  final tokens = <RichToken>[];
  var index = 0;

  void addText(String text) {
    if (text.isEmpty) return;
    // 直前も素の文字なら繋げる。Span が細切れにならないように。
    if (tokens.lastOrNull case final TextToken last) {
      tokens[tokens.length - 1] = TextToken(last.text + text);
      return;
    }
    tokens.add(TextToken(text));
  }

  for (final match in _tokenPattern.allMatches(source)) {
    if (match.start > index) addText(source.substring(index, match.start));
    index = match.end;

    final text = match.group(0)!;
    if (text.trim().isEmpty) {
      addText(text); // 空白はそのまま
    } else if (_urlPattern.hasMatch(text)) {
      tokens.add(UrlToken(text));
    } else if (text.startsWith('#')) {
      tokens.add(HashtagToken(text));
    } else if (text.startsWith('@')) {
      tokens.add(MentionToken(text));
    } else if (_rubyPattern.firstMatch(text) case final ruby?) {
      tokens.add(
        RubyToken(
          base: ruby.group(1) ?? ruby.group(2) ?? '',
          reading: ruby.group(3) ?? '',
        ),
      );
    } else {
      addText(text);
    }
  }

  if (index < source.length) addText(source.substring(index));
  return tokens;
}

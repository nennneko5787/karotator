import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:karotator/objects/rich_text.dart';
import 'package:karotator/pages/profile.dart';
import 'package:karotator/ui/rich/ruby.dart';
import 'package:karotator/ui/rich/spoiler.dart';
import 'package:karotator/utils.dart';

/// カロート本文を `InlineSpan` に組む。
///
/// 記法の解釈は [parseRichText] が担当し、ここは widget を当てるだけ。
/// 対応するのは URL・メンション・ハッシュタグ・ルビ・伏せ字
/// （仕様: specs/005-rich-text）。
class TextAgent {
  /// [shown] を出して [url] を開く。
  ///
  /// `www.example.com` のように、本文の見た目と実際に開く URL が違うことがある。
  static TextSpan generateLinkTextSpan(
    String url, {
    required TextStyle style,
    String? shown,
  }) {
    return TextSpan(
      text: shown ?? url,
      recognizer: TapGestureRecognizer()..onTap = () => openURL(url),
      style: style.apply(color: Colors.lightBlue),
    );
  }

  static TextSpan generateMentionTextSpan(
    String mention,
    BuildContext context, {
    required TextStyle style,
  }) {
    return TextSpan(
      text: mention,
      recognizer: TapGestureRecognizer()
        ..onTap = () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProfilePage(username: mention.substring(1)),
          ),
        ),
      style: style.apply(color: Colors.blue),
    );
  }

  static TextSpan generate(
    String rawText,
    BuildContext context, {
    TextStyle? style,
  }) {
    final baseStyle = style ?? const TextStyle();
    return TextSpan(
      children: _spans(parseRichText(rawText), context, baseStyle),
    );
  }

  static List<InlineSpan> _spans(
    List<RichToken> tokens,
    BuildContext context,
    TextStyle style,
  ) {
    final plain = style.apply(color: Theme.of(context).colorScheme.onSurface);

    return [
      for (final token in tokens)
        switch (token) {
          TextToken(:final text) => TextSpan(text: text, style: plain),

          // 表示は本文のまま、開くときだけ https:// を補う。
          UrlToken(:final raw, :final url) => generateLinkTextSpan(
            url,
            shown: raw,
            style: style,
          ),

          MentionToken(:final raw) => generateMentionTextSpan(
            raw,
            context,
            style: style,
          ),

          // 検索画面が無いのでリンクにはしない（005 の非目標）。
          HashtagToken(:final raw) => TextSpan(text: raw, style: plain),

          RubyToken(:final base, :final reading) => WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: RubyText(base: base, reading: reading, style: plain),
          ),

          SpoilerToken(:final children) => WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: SpoilerText(
              child: TextSpan(children: _spans(children, context, style)),
            ),
          ),
        },
    ];
  }
}

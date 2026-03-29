import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:karotator/pages/profile.dart';
import 'package:karotator/utils.dart';

class TextAgent {
  static RegExp get _urlRegExp => RegExp(
    r"(http(s)?:\/\/[a-zA-Z0-9-.!'()*;/?:@&=+$,%_#]+)",
    caseSensitive: false,
  );

  static RegExp get _mentionRegExp =>
      RegExp(r"(@[a-zA-Z0-9_]+)", caseSensitive: false);

  static TextSpan generateLinkTextSpan(String url, {required TextStyle style}) {
    final recognizer = TapGestureRecognizer()
      ..onTap = () async {
        await openURL(url);
      };
    final textSpan = TextSpan(
      text: url,
      recognizer: recognizer,
      style: style.apply(color: Colors.lightBlue),
    );
    return textSpan;
  }

  static TextSpan generateMentionTextSpan(
    String mention,
    BuildContext context, {
    required TextStyle style,
  }) {
    final recognizer = TapGestureRecognizer()
      ..onTap = () {
        final username = mention.substring(1);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(username: username),
          ),
        );
      };

    final textSpan = TextSpan(
      text: mention,
      recognizer: recognizer,
      style: style.apply(color: Colors.blue),
    );
    return textSpan;
  }

  static TextSpan generate(
    String rawText,
    BuildContext context, {
    TextStyle? style,
  }) {
    style ??= TextStyle();

    final List<TextSpan> textSpans = [];
    final splitRegExp = RegExp(
      '(${_urlRegExp.pattern})|(${_mentionRegExp.pattern})',
    );

    rawText.splitMapJoin(
      splitRegExp,
      onMatch: (Match match) {
        final matchedText = match.group(0) ?? '';
        if (_urlRegExp.hasMatch(matchedText)) {
          final urlSpan = generateLinkTextSpan(matchedText, style: style!);
          textSpans.add(urlSpan);
        } else if (_mentionRegExp.hasMatch(matchedText)) {
          final mentionSpan = generateMentionTextSpan(
            matchedText,
            context,
            style: style!,
          );
          textSpans.add(mentionSpan);
        }
        return '';
      },
      onNonMatch: (String text) {
        final commonSpan = TextSpan(text: text, style: style);
        textSpans.add(commonSpan);
        return '';
      },
    );

    return TextSpan(children: textSpans);
  }
}

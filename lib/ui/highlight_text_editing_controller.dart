import "package:flutter/material.dart";

class HighlightTextEditingController extends TextEditingController {
  static const maxLength = 200;

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final text = this.text;
    if (text.length <= maxLength) {
      return TextSpan(text: text, style: style);
    }
    return TextSpan(
      style: style,
      children: [
        TextSpan(text: text.substring(0, maxLength)),
        TextSpan(
          text: text.substring(maxLength),
          style: style?.copyWith(
            color: Colors.white,
            backgroundColor: Colors.red,
          ),
        ),
      ],
    );
  }
}

import "package:flutter/material.dart";

/// 伏せ字。`||ネタバレ||` を隠して描く。
///
/// 押すと開き、もう一度押すと閉じる。**隠している間も同じ文字を描いて
/// その上に覆いを重ねる**ので、開いた瞬間に本文が伸び縮みしない。
///
/// 仕様: specs/005-rich-text/design.md §3 (REQ-RICH-010, 011)
class SpoilerText extends StatefulWidget {
  const SpoilerText({super.key, required this.child});

  /// 隠す中身。URL やルビを含みうる。
  final InlineSpan child;

  @override
  State<SpoilerText> createState() => _SpoilerTextState();
}

class _SpoilerTextState extends State<SpoilerText> {
  bool _revealed = false;

  @override
  Widget build(BuildContext context) {
    final cover = Theme.of(context).colorScheme.onSurface;

    return GestureDetector(
      onTap: () => setState(() => _revealed = !_revealed),
      child: Stack(
        children: [
          // 覆っている間も同じ中身を描いて幅と高さを確保する。
          Opacity(
            opacity: _revealed ? 1 : 0,
            child: Text.rich(widget.child),
          ),
          if (!_revealed)
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: cover.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

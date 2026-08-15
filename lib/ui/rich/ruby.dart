import "package:flutter/material.dart";
import "package:flutter/rendering.dart";

/// ルビ付きの文字。`漢字《かんじ》` を描く。
///
/// Flutter の `TextSpan` にルビは無いので `WidgetSpan` として埋める。
///
/// **ベースラインを自分で申告する必要がある。** `Column` が報告する
/// ベースラインは*先頭の子*、つまり読みのものになるので、そのまま
/// `PlaceholderAlignment.baseline` に載せると本体が 1 行ぶん下へずれる。
/// [Baseline] で「上端から本体のベースラインまで」を明示して直す。
///
/// 仕様: specs/005-rich-text/design.md §3 (REQ-RICH-009)
class RubyText extends StatelessWidget {
  const RubyText({
    super.key,
    required this.base,
    required this.reading,
    this.style,
  });

  final String base;
  final String reading;
  final TextStyle? style;

  /// 読みは本体の半分強。行が膨らみすぎない大きさにする。
  static const double _readingScale = 0.55;

  @override
  Widget build(BuildContext context) {
    final baseStyle = style ?? DefaultTextStyle.of(context).style;
    final fontSize = baseStyle.fontSize ?? 14;
    final readingStyle = baseStyle.copyWith(
      fontSize: fontSize * _readingScale,
      height: 1,
    );
    final bodyStyle = baseStyle.copyWith(height: 1);

    final scaler = MediaQuery.textScalerOf(context);
    final readingHeight = _measure(reading, readingStyle, scaler).height;
    final body = _measure(base, bodyStyle, scaler);
    final bodyBaseline = body.computeDistanceToActualBaseline(
      TextBaseline.alphabetic,
    );

    return _BaselineOverride(
      // 上端から本体のベースラインまで。読みの高さぶん下にある。
      baseline: readingHeight + bodyBaseline,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(reading, textAlign: TextAlign.center, style: readingStyle),
          Text(base, style: bodyStyle),
        ],
      ),
    );
  }

  /// 高さとベースラインを知るために一度だけ組む。
  /// 数文字なので毎ビルド測っても問題にならない。
  TextPainter _measure(String text, TextStyle style, TextScaler scaler) =>
      TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr,
        textScaler: scaler,
      )..layout();
}

/// 子が申告するベースラインを差し替える。
///
/// `Column` は**先頭の子**のベースラインを申告するので、そのままだと読みの
/// ベースラインが使われて本体が 1 行ぶん下へずれる。`Baseline` は「子が申告する
/// 値を基準に位置をずらす」仕組みなので、この用途には使えない（ずらすほど
/// さらに下がる）。申告値そのものを置き換える必要がある。
class _BaselineOverride extends SingleChildRenderObjectWidget {
  const _BaselineOverride({required this.baseline, required super.child});

  /// 上端からベースラインまでの距離。
  final double baseline;

  @override
  RenderObject createRenderObject(BuildContext context) =>
      _RenderBaselineOverride(baseline);

  @override
  void updateRenderObject(
    BuildContext context,
    _RenderBaselineOverride renderObject,
  ) => renderObject.baseline = baseline;
}

class _RenderBaselineOverride extends RenderProxyBox {
  _RenderBaselineOverride(this._baseline);

  double _baseline;

  set baseline(double value) {
    if (value == _baseline) return;
    _baseline = value;
    markNeedsLayout();
  }

  @override
  double? computeDistanceToActualBaseline(TextBaseline baseline) => _baseline;
}

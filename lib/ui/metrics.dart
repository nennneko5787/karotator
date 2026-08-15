import "package:flutter/material.dart";

/// カロート表示の寸法。
///
/// 「UI サイズ」設定はこの値だけを動かす。**アプリバーや下タブ、ダイアログは
/// 変えない**（画面全体を拡大縮小するのではなく、カロートの部品だけを
/// 大きくしたり小さくしたりする）。
///
/// 各ウィジェットが個別に倍率を受け取らなくて済むよう、[PostMetricsScope] で
/// 木に流して [PostMetrics.of] で拾う。
class PostMetrics {
  const PostMetrics({this.scale = 1.0});

  /// 1.0 が既定。設定で変わる。
  final double scale;

  // --- 行の骨格 ---

  double get avatarSize => 40 * scale;
  double get horizontalPadding => 16 * scale;
  double get gap => 12 * scale;
  double get verticalPadding => 12 * scale;
  double get connectorWidth => 2 * scale;

  /// 本文列の左端。字下げを合わせたい呼び出し側が使う。
  double get contentOffset => horizontalPadding + avatarSize + gap;

  // --- 文字 ---

  /// 一覧のカロート本文。
  double get fontSize => 14 * scale;

  /// 引用元プレビューの本文。
  double get quoteFontSize => 13 * scale;

  /// 詳細ページの主役の本文。
  double get focusedFontSize => 17 * scale;

  // --- Markdown ---

  /// 見出しの大きさ。本文からの倍率で決める。
  double headingSize(double body, int level) =>
      body *
      switch (level) {
        1 => 1.6,
        2 => 1.4,
        3 => 1.25,
        4 => 1.15,
        5 => 1.05,
        _ => 1.0,
      };

  /// `-# ` の段落。
  double subtextSize(double body) => body * 0.85;

  /// コード。等幅は本文より詰まって見えるので少し小さめにしない。
  double codeSize(double body) => body * 0.95;

  // --- 操作列 ---

  double get actionIconSize => 16 * scale;
  double get actionFontSize => 11 * scale;

  /// 幅いっぱいに広げない。倍率を上げても間延びしないよう一緒に伸ばす。
  double get actionMaxWidth => 425 * scale;

  // --- リアクション ---

  double get reactionHeight => 28 * scale;
  double get reactionGlyphSize => 16 * scale;
  double get reactionFontSize => 12 * scale;

  // --- 引用元 ---

  double get quoteAvatarSize => 20 * scale;

  /// 今の倍率。木に無ければ等倍。
  static PostMetrics of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PostMetricsScope>()?.metrics ??
      const PostMetrics();
}

/// [PostMetrics] を木に流す。`main.dart` が 1 つだけ置く。
class PostMetricsScope extends InheritedWidget {
  const PostMetricsScope({
    super.key,
    required this.metrics,
    required super.child,
  });

  final PostMetrics metrics;

  @override
  bool updateShouldNotify(PostMetricsScope oldWidget) =>
      metrics.scale != oldWidget.metrics.scale;
}

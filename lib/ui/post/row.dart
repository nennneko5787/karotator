import "package:flutter/material.dart";
import "package:karotator/ui/metrics.dart";

/// 一覧に並ぶ 1 行の骨格。左にアバター列、右に中身。
///
/// Twitter と同じで、カードでは囲わず全幅に敷いて下に 1px の区切り線を引く。
/// スレッドの縦線はアバターの中心を通るので、アバターの大きさと余白から
/// 位置を決める必要がある。ここに定数を集約しているのはそのため。
class PostRow extends StatelessWidget {
  const PostRow({
    super.key,
    required this.avatar,
    required this.child,
    this.header,
    this.connectorAbove = false,
    this.connectorBelow = false,
    this.showDivider = true,
    this.onTap,
  }) : assert(
         header == null || (!connectorAbove && !connectorBelow),
         '見出しがあるとアバターの位置が下にずれ、縦線が繋がらない。'
         'スレッドの行に見出しを付けたくなったら、まず縦線の起点を'
         '見出しの高さ込みで測る作りに直すこと。',
       );

  /// アバター。大きさは [avatarSize] に合わせて呼び出し側が作る。
  final Widget avatar;

  /// 本文側。ヘッダー行から操作列まで。
  final Widget child;

  /// 行の上に出す小見出し。「〇〇さんがリカロート」「固定されたポスト」。
  /// アバター列の分だけ字下げして出す。
  final Widget? header;

  /// アバターの上に縦線を伸ばす。スレッドの子側。
  final bool connectorAbove;

  /// アバターの下に縦線を伸ばす。スレッドの親側。
  final bool connectorBelow;

  final bool showDivider;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final lineColor = Theme.of(context).dividerColor;
    // 寸法は「UI サイズ」設定で変わる。定数を直接書かない。
    final metrics = PostMetrics.of(context);
    final avatarSize = metrics.avatarSize;
    final horizontalPadding = metrics.horizontalPadding;
    final gap = metrics.gap;
    final verticalPadding = metrics.verticalPadding;
    final connectorWidth = metrics.connectorWidth;

    // 縦線はアバターの中心を通す。Stack で敷いてから本体を重ねる。
    final connectorLeft = horizontalPadding + (avatarSize - connectorWidth) / 2;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: showDivider
            ? BoxDecoration(
                border: Border(bottom: BorderSide(color: lineColor, width: 1)),
              )
            : null,
        child: Stack(
          children: [
            if (connectorAbove)
              Positioned(
                left: connectorLeft,
                top: 0,
                // 行の上端からアバターの中心まで。見出しがあると位置がずれる
                // ので、コンストラクタの assert で組み合わせを禁じている。
                height: verticalPadding + avatarSize / 2,
                width: connectorWidth,
                child: ColoredBox(color: lineColor),
              ),
            if (connectorBelow)
              Positioned(
                left: connectorLeft,
                top: verticalPadding + avatarSize / 2,
                bottom: 0,
                width: connectorWidth,
                child: ColoredBox(color: lineColor),
              ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (header != null)
                    Padding(
                      padding: EdgeInsets.only(
                        left: avatarSize + gap,
                        bottom: 4,
                      ),
                      child: header!,
                    ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: avatarSize,
                        height: avatarSize,
                        child: avatar,
                      ),
                      SizedBox(width: gap),
                      Expanded(child: child),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// 行の上に出す小見出し。アイコン + 灰色の小さな文字。
class PostRowLabel extends StatelessWidget {
  const PostRowLabel({super.key, required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).secondaryHeaderColor;
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 6,
      children: [
        Icon(icon, size: 14, color: color),
        Flexible(
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

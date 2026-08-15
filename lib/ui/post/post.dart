import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/post/avatar.dart";
import "package:karotator/ui/post/content.dart";
import "package:karotator/ui/post/header.dart";
import "package:karotator/ui/metrics.dart";
import "package:karotator/ui/post/hidden.dart";
import "package:karotator/ui/post/row.dart";

/// 一覧に並ぶカロート 1 件。
///
/// カードでは囲わない。全幅に敷いて下に区切り線を引くだけで、スレッドの
/// 縦線が通せる形にしてある（[PostRow]）。
class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
    this.fontSize,
    this.disablePageTransition = false,
    this.pinned = false,
    this.connectorAbove = false,
    this.connectorBelow = false,
    this.showDivider = true,
    this.revealMutedOrBlocked = false,
  });

  final Post post;

  /// 省略時は「UI サイズ」設定に従う。
  final double? fontSize;

  /// 詳細ページへ飛ばさない。詳細ページ自身で使う。
  final bool disablePageTransition;
  final bool pinned;

  /// スレッドの縦線。上は親から、下は子へ。
  final bool connectorAbove;
  final bool connectorBelow;

  final bool showDivider;

  /// 閲覧者が「表示する」を押した後。引用元にも引き継ぐ (REQ-HIDE-015)。
  final bool revealMutedOrBlocked;

  @override
  Widget build(BuildContext context) {
    final rekarotedBy = post.rekarotedBy;
    final fontSize = this.fontSize ?? PostMetrics.of(context).fontSize;
    // スレッドの中では見出しを出さない。アバターが下にずれて縦線が繋がらない。
    final inThread = connectorAbove || connectorBelow;

    return PostRow(
      connectorAbove: connectorAbove,
      connectorBelow: connectorBelow,
      showDivider: showDivider,
      onTap: disablePageTransition
          ? null
          : () => openPostDetail(
              context,
              post.id,
              includeMutedOrBlocked: revealMutedOrBlocked,
            ),
      header: switch ((inThread, pinned, rekarotedBy)) {
        (true, _, _) => null,
        (false, true, _) => const PostRowLabel(
          icon: Icons.push_pin,
          text: "固定されたポスト",
        ),
        (false, false, final by?) => PostRowLabel(
          icon: Icons.repeat,
          text: "${by.displayName} さんがリカロート",
        ),
        _ => null,
      },
      avatar: PostUserAvatar(
        avatarUrl: post.author.avatarUrl,
        username: post.author.username,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          PostUserDetail(
            author: post.author,
            createdAt: post.createdAt,
            fontSize: fontSize,
          ),
          PostContent(
            post: post,
            fontSize: fontSize,
            revealMutedOrBlocked: revealMutedOrBlocked,
          ),
        ],
      ),
    );
  }
}

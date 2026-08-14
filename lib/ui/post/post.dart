import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/ui/post/avatar.dart";
import "package:karotator/ui/post/content.dart";
import "package:karotator/ui/post/header.dart";

/// 一覧に並ぶカロート 1 件。
///
/// 上下の角丸と区切り線は一覧の中での位置で決まるので、[isFirst] / [isLast] を
/// 呼び出し側から渡してもらう。
class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.post,
    required this.isFirst,
    required this.isLast,
    this.fontSize = 12,
    this.disablePageTransition = false,
    this.pinned = false,
  });

  final AbstractPost post;
  final bool isFirst;
  final bool isLast;
  final double fontSize;

  /// 詳細ページへ飛ばさない。詳細ページ自身で使う。
  final bool disablePageTransition;
  final bool pinned;

  Future<void> _openDetail(BuildContext context) async {
    // 一覧のカロートは情報が欠けているので取り直す。
    final full = await KarotterApi().posts.byId(post.id);
    if (!context.mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => PostDetailPage(post: full)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.vertical(
      top: isFirst ? const Radius.circular(16) : Radius.zero,
      bottom: isLast ? const Radius.circular(16) : Radius.zero,
    );
    final rekarotedBy = post is Post ? (post as Post).rekarotedBy : null;

    return Container(
      decoration: BoxDecoration(
        border: isLast
            ? null
            : Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1,
                ),
              ),
      ),
      child: ClipRRect(
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            borderRadius: radius,
          ),
          child: Column(
            children: [
              if (rekarotedBy != null)
                PostRekarotedByLabel(rekarotedBy: rekarotedBy.displayName),
              if (pinned) const PostPinnedLabel(),
              GestureDetector(
                onTap: disablePageTransition
                    ? null
                    : () => _openDetail(context),
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: radius),
                  titleAlignment: ListTileTitleAlignment.top,
                  leading: PostUserAvatar(
                    avatarUrl: post.author.avatarUrl,
                    username: post.author.username,
                  ),
                  title: PostUserDetail(post: post, fontSize: fontSize),
                  subtitle: PostContent(post: post, fontSize: fontSize),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

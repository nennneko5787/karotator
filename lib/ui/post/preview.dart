import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/post/avatar.dart";
import "package:karotator/ui/post/header.dart";
import "package:karotator/ui/post/hidden.dart";
import "package:karotator/ui/post/media.dart";
import "package:karotator/ui/text_agent.dart";

/// 埋め込みプレビューの枠。引用元と固定ポストが共有する。
///
/// タップすると必ず取り直してから詳細ページへ行く。一覧に埋まっている
/// プレビューは情報が欠けているため。表示できないものはタップしても動かない。
///
/// 仕様: specs/003-hidden-posts/design.md §6 (REQ-HIDE-009, 011)
class PostPreviewCard extends StatelessWidget {
  const PostPreviewCard({
    super.key,
    required this.quote,
    this.label,
    this.fontSize = 12,
    this.revealMutedOrBlocked = false,
    this.onRevealed,
  });

  final Quote quote;

  /// 「固定されたポスト」など、枠の上に出す見出し。
  final Widget? label;

  final double fontSize;

  /// 閲覧者が既に「表示する」を押している。ここから辿る先にも引き継ぐ
  /// (REQ-HIDE-015)。
  final bool revealMutedOrBlocked;

  /// この枠の中で「表示する」が成功したときに呼ぶ。
  final ValueChanged<Post>? onRevealed;

  @override
  Widget build(BuildContext context) {
    final body = switch (quote) {
      HiddenPost hidden => HiddenPostCard(
        post: hidden,
        surface: HiddenPostSurface.quote,
        fontSize: fontSize,
        onRevealed: onRevealed,
      ),
      QuotedPost preview => _PreviewBody(
        preview: preview,
        fontSize: fontSize,
        revealMutedOrBlocked: revealMutedOrBlocked,
      ),
    };

    if (label == null) return body;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [label!, body],
    );
  }
}

class _PreviewBody extends StatelessWidget {
  const _PreviewBody({
    required this.preview,
    required this.fontSize,
    required this.revealMutedOrBlocked,
  });

  final QuotedPost preview;
  final double fontSize;
  final bool revealMutedOrBlocked;

  @override
  Widget build(BuildContext context) {
    // 引用の中はアバターを小さくして名前と同じ行に置く。本体のカードと
    // 見分けが付くようにするため（Twitter の引用ツイートと同じ組み方）。
    return InkWell(
      onTap: () => openPostDetail(
        context,
        preview.id,
        includeMutedOrBlocked: revealMutedOrBlocked,
      ),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          borderRadius: BorderRadius.circular(16),
        ),
        clipBehavior: Clip.antiAlias,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              spacing: 6,
              children: [
                SizedBox(
                  width: 20,
                  height: 20,
                  child: PostUserAvatar(
                    avatarUrl: preview.author.avatarUrl,
                    username: preview.author.username,
                  ),
                ),
                Flexible(
                  child: PostUserDetail(
                    author: preview.author,
                    createdAt: preview.createdAt,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),
            if (preview.content.isNotEmpty)
              Text.rich(
                TextAgent.generate(
                  preview.content,
                  context,
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
            if (preview.mediaUrls.isNotEmpty)
              PostMedia(
                mediaUrls: preview.mediaUrls,
                mediaTypes: preview.mediaTypes,
              ),
          ],
        ),
      ),
    );
  }
}

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/providers/post.dart";
import "package:karotator/ui/post/actions.dart";
import "package:karotator/ui/post/avatar.dart";
import "package:karotator/ui/post/body.dart";
import "package:karotator/ui/post/media.dart";
import "package:karotator/ui/post/poll.dart";
import "package:karotator/ui/post/preview.dart";
import "package:karotator/ui/post/reaction.dart";
import "package:karotator/ui/metrics.dart";
import "package:karotator/utils.dart";

/// カロート詳細で主役として出す 1 件。
///
/// 一覧の [PostWidget] とは組み方が違う。Twitter と同じで、
///
/// - 作者は 2 行（表示名 / @ID）。時刻は横に付けない
/// - 本文は一回り大きい
/// - 時刻は絶対時刻で本文の下に独立して置く
/// - 件数は一覧と同じく操作列のアイコンの横に出す
class FocusedPostWidget extends ConsumerStatefulWidget {
  const FocusedPostWidget({
    super.key,
    required this.post,
    this.connectorAbove = false,
    this.revealMutedOrBlocked = false,
  });

  final Post post;

  /// 親カロートから縦線が伸びてくる。
  final bool connectorAbove;

  final bool revealMutedOrBlocked;

  @override
  ConsumerState<FocusedPostWidget> createState() => _FocusedPostWidgetState();
}

class _FocusedPostWidgetState extends ConsumerState<FocusedPostWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(postProvider(widget.post.id).notifier).initialize(widget.post);
    });
  }

  @override
  Widget build(BuildContext context) {
    final original = widget.post;
    final subColor = Theme.of(context).secondaryHeaderColor;
    final lineColor = Theme.of(context).dividerColor;
    final metrics = PostMetrics.of(context);
    final quote = original.quote;
    final threadParentAuthor = original.getThreadParentAuthor();

    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: lineColor, width: 1)),
      ),
      child: Stack(
        children: [
          if (widget.connectorAbove)
            Positioned(
              left:
                  metrics.horizontalPadding +
                  (metrics.avatarSize - metrics.connectorWidth) / 2,
              top: 0,
              height: metrics.verticalPadding + metrics.avatarSize / 2,
              width: metrics.connectorWidth,
              child: ColoredBox(color: lineColor),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: metrics.horizontalPadding,
              vertical: metrics.verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12,
              children: [
                _AuthorBlock(post: original),
                if (threadParentAuthor != null)
                  _ReplyingTo(author: threadParentAuthor),
                if (original.content.isNotEmpty)
                  PostBody(
                    content: original.content,
                    style: TextStyle(
                      fontSize: metrics.focusedFontSize,
                      height: 1.4,
                    ),
                  ),
                if (original.mediaUrls.isNotEmpty)
                  PostMedia(
                    mediaUrls: original.mediaUrls,
                    mediaTypes: original.mediaTypes,
                  ),
                if (original.poll != null) PollWidget(post: original),
                if (quote != null)
                  PostPreviewCard(
                    quote: quote,
                    revealMutedOrBlocked: widget.revealMutedOrBlocked,
                  ),

                // 絶対時刻。件数は操作列のアイコンの横に出すので、ここには
                // 表示回数も含めて数字を置かない。
                Text(
                  getAbsoluteDateTime(original.createdAt),
                  style: TextStyle(fontSize: 13, color: subColor),
                ),

                ReactionWidget(post: original),

                // 一覧と同じく、件数はアイコンの横に出す。
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: PostActionsWidget(post: original),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// アバターと、表示名 / @ID の 2 行。
class _AuthorBlock extends StatelessWidget {
  const _AuthorBlock({required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final subColor = Theme.of(context).secondaryHeaderColor;
    final metrics = PostMetrics.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: metrics.avatarSize,
          height: metrics.avatarSize,
          child: PostUserAvatar(
            avatarUrl: post.author.avatarUrl,
            username: post.author.username,
          ),
        ),
        SizedBox(width: metrics.gap),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                spacing: 4,
                children: [
                  Flexible(
                    child: Text(
                      post.author.displayName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  ...getUserPrimaryMark(post.author, size: 17),
                ],
              ),
              Text(
                "@${post.author.username}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontSize: 14, color: subColor),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 「返信先: @someone」。主役では字下げせず独立した行にする。
class _ReplyingTo extends StatelessWidget {
  const _ReplyingTo({required this.author});

  final Author author;

  @override
  Widget build(BuildContext context) {
    final subColor = Theme.of(context).secondaryHeaderColor;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "返信先: ",
            style: TextStyle(color: subColor),
          ),
          TextSpan(
            text: "@${author.username}",
            style: const TextStyle(color: Color(0xFF1D9BF0)),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProfilePage(username: author.username),
                ),
              ),
          ),
        ],
      ),
      style: const TextStyle(fontSize: 14),
    );
  }
}

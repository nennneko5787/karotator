import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/ui/post/actions.dart";
import "package:karotator/ui/post/body.dart";
import "package:karotator/ui/post/media.dart";
import "package:karotator/ui/post/poll.dart";
import "package:karotator/ui/post/preview.dart";
import "package:karotator/ui/post/reaction.dart";

/// カロートの中身。本文・メディア・投票・引用元・リアクション・操作列。
///
/// 引用元は入れ子にせず [PostPreviewCard] が描く。以前は自分自身を入れ子に
/// していたが、引用元は本体と同じ形をしていないので分けた
/// （specs/003-hidden-posts/design.md §6）。
class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.post,
    this.hideActions = false,
    this.hideReplyTo = false,
    this.fontSize = 12,
    this.revealMutedOrBlocked = false,
  });

  final Post post;
  final bool hideActions;
  final bool hideReplyTo;
  final double fontSize;

  /// 閲覧者が「表示する」を押した後。引用元にも引き継ぐ (REQ-HIDE-015)。
  final bool revealMutedOrBlocked;

  @override
  Widget build(BuildContext context) {
    final threadParentAuthor = post.getThreadParentAuthor();
    final quote = post.quote;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        if (threadParentAuthor != null)
          _ReplyToLabel(
            author: threadParentAuthor,
            fontSize: fontSize,
            showPrefix: !hideReplyTo,
          ),
        if (post.content.isNotEmpty)
          PostBody(
            content: post.content,
            style: TextStyle(fontSize: fontSize),
          ),
        if (post.mediaUrls.isNotEmpty)
          PostMedia(mediaUrls: post.mediaUrls, mediaTypes: post.mediaTypes),
        if (post.poll != null) PollWidget(post: post),
        if (quote != null)
          PostPreviewCard(
            quote: quote,
            fontSize: fontSize,
            revealMutedOrBlocked: revealMutedOrBlocked,
          ),
        ReactionWidget(post: post),
        if (!hideActions) PostActionsWidget(post: post),
      ],
    );
  }
}

/// 「返信先: @someone」。
class _ReplyToLabel extends StatelessWidget {
  const _ReplyToLabel({
    required this.author,
    required this.fontSize,
    required this.showPrefix,
  });

  final Author author;
  final double fontSize;
  final bool showPrefix;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (showPrefix)
            TextSpan(
              text: "返信先: ",
              style: DefaultTextStyle.of(
                context,
              ).style.copyWith(fontSize: fontSize),
            ),
          TextSpan(
            text: "@${author.username}",
            style: TextStyle(color: Colors.blue, fontSize: fontSize),
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
    );
  }
}

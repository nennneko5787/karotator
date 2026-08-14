import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/ui/post/actions.dart";
import "package:karotator/ui/post/avatar.dart";
import "package:karotator/ui/post/header.dart";
import "package:karotator/ui/post/media.dart";
import "package:karotator/ui/post/poll.dart";
import "package:karotator/ui/post/reaction.dart";
import "package:karotator/ui/text_agent.dart";

/// カロートの中身。本文・メディア・投票・引用元・リアクション・操作列。
///
/// 引用元の描画で自分自身を入れ子にする。その場合は [hideActions] と
/// [hideReplyTo] を立てて、操作列と「返信先」を二重に出さないようにしている。
class PostContent extends StatelessWidget {
  const PostContent({
    super.key,
    required this.post,
    this.hideActions = false,
    this.hideReplyTo = false,
    this.fontSize = 12,
  });

  final AbstractPost post;
  final bool hideActions;
  final bool hideReplyTo;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final threadParentAuthor = post is Post
        ? (post as Post).getThreadParentAuthor()
        : null;

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
        Text.rich(
          TextAgent.generate(
            post.content,
            context,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        if (post.mediaUrls.isNotEmpty) PostMedia(post: post),
        if (post case final Post p when p.poll != null) PollWidget(post: p),
        if (post case final Post p when p.quotedPost != null)
          _QuotedPostCard(quotedPost: p.quotedPost!),
        if (post case final Post p) ReactionWidget(post: p),
        if (post case final Post p when !hideActions)
          PostActionsWidget(post: p),
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

/// 引用元のカロートを囲んで表示する。
class _QuotedPostCard extends StatelessWidget {
  const _QuotedPostCard({required this.quotedPost});

  final QuotedPost quotedPost;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // 一覧に埋まっている引用元は情報が欠けているので取り直す。
        final full = await KarotterApi().posts.byId(quotedPost.id);
        if (!context.mounted) return;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => PostDetailPage(post: full)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          titleAlignment: ListTileTitleAlignment.top,
          leading: PostUserAvatar(avatarUrl: quotedPost.author.avatarUrl),
          title: PostUserDetail(post: quotedPost),
          subtitle: PostContent(
            post: quotedPost,
            hideActions: true,
            hideReplyTo: true,
          ),
        ),
      ),
    );
  }
}

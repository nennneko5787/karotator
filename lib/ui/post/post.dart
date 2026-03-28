import "package:flutter/material.dart";
import "package:karotator/factory/post.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/pages/post_detail.dart";

class PostWidget extends StatefulWidget {
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
  final bool disablePageTransition;
  final bool pinned;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late final AbstractPost post = widget.post;
  late final bool isFirst = widget.isFirst;
  late final bool isLast = widget.isLast;
  late final double fontSize = widget.fontSize;
  late final bool disablePageTransition = widget.disablePageTransition;
  late final bool pinned = widget.pinned;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.vertical(
      top: isFirst ? const Radius.circular(16) : Radius.zero,
      bottom: isLast ? const Radius.circular(16) : Radius.zero,
    );

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
              if (post is Post && (post as Post).rekarotedBy != null)
                postRekarotedByFactory(post as Post),
              if (pinned) postPinnedFactory(),
              GestureDetector(
                onTap: disablePageTransition
                    ? null
                    : () async {
                        final fullPost = await HTTPClient().getPostById(
                          post.id,
                        );

                        if (!context.mounted) return;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PostDetailPage(post: fullPost),
                          ),
                        );
                      },
                child: ListTile(
                  shape: RoundedRectangleBorder(borderRadius: radius),
                  titleAlignment: ListTileTitleAlignment.top,
                  leading: postUserAvatarFactory(
                    post.author.avatarUrl,
                    context: context,
                    username: post.author.username,
                  ),
                  title: postUserDetailFactory(
                    post,
                    context,
                    fontSize: fontSize,
                  ),
                  subtitle: postContentFactory(
                    post,
                    context,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

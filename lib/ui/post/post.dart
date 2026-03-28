import "package:flutter/material.dart";
import "package:karotator/factory/post.dart";
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
  });

  final Post post;
  final bool isFirst;
  final bool isLast;
  final double fontSize;
  final bool disablePageTransition;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  late final Post post = widget.post;
  late final bool isFirst = widget.isFirst;
  late final bool isLast = widget.isLast;
  late final double fontSize = widget.fontSize;
  late final bool disablePageTransition = widget.disablePageTransition;

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
              if (post.rekarotedBy != null) postRekarotedByFactory(post),
              GestureDetector(
                onTap: disablePageTransition
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PostDetailPage(post: post),
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

import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/enum.dart";
import "package:karotator/factory/poll.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/state.dart";
import "package:karotator/pages/post.dart";
import "package:karotator/providers/post.dart";
import "package:karotator/ui/media_viewer.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";

Widget postRekarotedByFactory(Post post) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(width: 12),
      const Icon(Icons.repeat, size: 16),
      TextButton(
        onPressed: () {},
        child: Text(
          "${post.rekarotedBy!.displayName} さんがリカロート",
          style: const TextStyle(fontSize: 12),
        ),
      ),
    ],
  );
}

Widget postUserAvatarFactory(String? avatarUrl) {
  return Wrap(
    children: [
      Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              avatarUrl != null
                  ? "https://karotter.com$avatarUrl"
                  : "https://karotter.com/default-avatar.png",
            ),
          ),
        ),
      ),
    ],
  );
}

Widget postUserDetailFactory(
  Post post,
  BuildContext context, {
  double fontSize = 12,
}) {
  final subStyle = TextStyle(
    color: Theme.of(context).secondaryHeaderColor,
    fontSize: fontSize - 1,
  );
  return Column(
    children: [
      Row(
        children: [
          Flexible(
            child: Text(
              post.author.displayName,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: fontSize),
            ),
          ),
          Text(" ", style: subStyle),
          Flexible(
            child: Text(
              "@${post.author.username}",
              style: subStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(" · ", style: subStyle),
          Text(getLocalizedDateTime(post.createdAt), style: subStyle),
        ],
      ),
    ],
  );
}

Widget postContentFactory(
  Post post,
  BuildContext context, {
  bool hideActions = false,
  double fontSize = 12,
}) {
  final threadParentAuthor = post.getThreadParentAuthor();
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 10,
    children: [
      if (threadParentAuthor != null)
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "返信先: ",
                style: DefaultTextStyle.of(
                  context,
                ).style.copyWith(fontSize: fontSize),
              ),
              TextSpan(
                text: "@${threadParentAuthor.username}",
                style: TextStyle(color: Colors.blue, fontSize: fontSize),
                recognizer: TapGestureRecognizer()..onTap = () async {},
              ),
            ],
          ),
        ),
      Text(post.content, style: TextStyle(fontSize: fontSize)),
      if (post.mediaUrls.isNotEmpty) postMediaFactory(post, context),
      if (post.poll != null) pollFactory(post),
      if (hideActions == false) PostActionsWidget(post: post),
    ],
  );
}

Widget postMediaFactory(Post post, BuildContext context) {
  final urls = post.mediaUrls.map((e) => "https://karotter.com$e").toList();
  final isVideos = post.mediaTypes.map((e) => e == "video").toList();

  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: AspectRatio(
      aspectRatio: getAspectRatio(urls.length),
      child: buildMediaLayout(urls, isVideos, context),
    ),
  );
}

Widget postMedia(
  List<String> urls,
  List<bool> isVideos,
  int index,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              MediaViewer(urls: urls, isVideos: isVideos, initialIndex: index),
        ),
      );
    },
    child: isVideos[index]
        ? Stack(
            fit: StackFit.expand,
            children: [
              Container(color: Colors.black),
              const Center(
                child: Icon(
                  Icons.play_circle_outline,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ],
          )
        : Image.network(urls[index], fit: BoxFit.cover),
  );
}

Widget buildMediaLayout(
  List<String> urls,
  List<bool> isVideos,
  BuildContext context,
) {
  switch (urls.length) {
    case 1:
      return postMedia(urls, isVideos, 0, context);
    case 2:
      return Row(
        children: [
          Expanded(child: postMedia(urls, isVideos, 0, context)),
          const SizedBox(width: 2),
          Expanded(child: postMedia(urls, isVideos, 1, context)),
        ],
      );
    case 3:
      return Row(
        children: [
          Expanded(child: postMedia(urls, isVideos, 0, context)),
          const SizedBox(width: 2),
          Expanded(
            child: Column(
              children: [
                Expanded(child: postMedia(urls, isVideos, 1, context)),
                const SizedBox(height: 2),
                Expanded(child: postMedia(urls, isVideos, 2, context)),
              ],
            ),
          ),
        ],
      );
    default:
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: urls.length > 4 ? 4 : urls.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              postMedia(urls, isVideos, index, context),
              if (index == 3 && urls.length > 4)
                Container(
                  color: Colors.black54,
                  child: Center(
                    child: Text(
                      "+${urls.length - 4}",
                      style: const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                ),
            ],
          );
        },
      );
  }
}

double getAspectRatio(int count) {
  if (count == 1) return 16 / 9;
  if (count == 2) return 16 / 9;
  return 1;
}

class PostActionsWidget extends ConsumerWidget {
  final Post post;

  const PostActionsWidget({super.key, required this.post});

  void showModeMenu(BuildContext context, PostNotifier notifier, Post current) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: (post.rekaroted) ? const Icon(Icons.close, color: Colors.red) : const Icon(Icons.repeat),
                title: (post.rekaroted) ? const Text("リカロートを取り消す", style: TextStyle(color: Colors.red)) : const Text("リカロート"),
                onTap: () {
                  notifier.toggleRekarot();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Symbols.stylus),
                title: const Text("引用リカロート"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PostPage(post: post, type: InternalPostType.rekarot),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = PostState(
      id: post.id,
      bookmarked: post.bookmarked,
      bookmarksCount: post.bookmarksCount,
      rekaroted: post.rekaroted,
      rekarotsCount: post.rekarotsCount,
      liked: post.liked,
      likesCount: post.likesCount,
    );
    final currentPost = ref.watch(postProvider(postState));
    final notifier = ref.read(postProvider(postState).notifier);

    final color = Theme.of(context).secondaryHeaderColor;
    final style = TextStyle(color: color, fontSize: 12);

    Widget actionItem(
      IconData icon,
      int count,
      VoidCallback onTap, {
      Color? iconColor,
    }) {
      return Row(
        children: [
          IconButton(
            icon: Icon(icon, size: 16),
            color: iconColor ?? color,
            onPressed: onTap,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            visualDensity: VisualDensity.compact,
          ),
          const SizedBox(width: 4),
          Text("$count", style: style),
        ],
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        actionItem(Icons.comment_outlined, post.repliesCount, () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PostPage(post: post, type: InternalPostType.reply),
            ),
          );
        }),
        actionItem(
          Icons.repeat,
          currentPost.rekarotsCount,
          () => showModeMenu(context, notifier, currentPost),
          iconColor: currentPost.rekaroted ? Colors.lightGreenAccent : null,
        ),
        actionItem(
          currentPost.liked ? Icons.favorite : Icons.favorite_outline,
          currentPost.likesCount,
          () => notifier.toggleLike(),
          iconColor: currentPost.liked ? Colors.red : null,
        ),
        actionItem(
          currentPost.bookmarked ? Icons.bookmark : Icons.bookmark_outline,
          post.bookmarksCount,
          () => notifier.toggleBookmark(),
          iconColor: currentPost.bookmarked ? Colors.lightBlueAccent : null,
        ),
        actionItem(Icons.analytics, post.viewsCount, () {}),
      ],
    );
  }
}

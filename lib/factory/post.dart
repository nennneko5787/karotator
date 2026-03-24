import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/utils.dart";

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

Widget postUserDetailFactory(Post post) {
  return Row(
    children: [
      Flexible(
        child: Text(post.author.displayName, overflow: TextOverflow.ellipsis),
      ),
      const SizedBox(width: 8),
      Flexible(
        child: Text(
          "@${post.author.username}",
          style: TextStyle(color: Color.fromARGB(255, 107, 114, 128)),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Text(" · ", style: TextStyle(color: Color.fromARGB(255, 107, 114, 128))),
      Text(
        getLocalizedDateTime(post.createdAt),
        style: TextStyle(color: Color.fromARGB(255, 107, 114, 128)),
      ),
    ],
  );
}

Widget postContentFactory(Post post) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [Text(post.content), postActionsFactory(post)],
  );
}

Widget postActionsFactory(Post post) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.comment_outlined),
            onPressed: () {},
          ),
          Text("${post.repliesCount}"),
        ],
      ),
      Row(
        children: [
          IconButton(icon: const Icon(Icons.repeat), onPressed: () {}),
          Text("${post.rekarotsCount}"),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.favorite_outline),
            onPressed: () {},
          ),
          Text("${post.likesCount}"),
        ],
      ),
      Row(
        children: [
          IconButton(
            icon: const Icon(Icons.bookmark_outline),
            onPressed: () {},
          ),
          Text("${post.bookmarksCount}"),
        ],
      ),
    ],
  );
}

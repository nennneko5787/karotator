import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/utils.dart";

/// 「固定されたポスト」の見出し。
class PostPinnedLabel extends StatelessWidget {
  const PostPinnedLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 12),
        Icon(Icons.push_pin, size: 16),
        Text("固定されたポスト", style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

/// 「〇〇さんがリカロート」の見出し。
class PostRekarotedByLabel extends StatelessWidget {
  const PostRekarotedByLabel({super.key, required this.rekarotedBy});

  final String rekarotedBy;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 12),
        const Icon(Icons.repeat, size: 16),
        TextButton(
          onPressed: () {},
          child: Text(
            "$rekarotedBy さんがリカロート",
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}

/// 表示名・公式マーク・ID・投稿時刻の 1 行。
class PostUserDetail extends StatelessWidget {
  const PostUserDetail({super.key, required this.post, this.fontSize = 12});

  final AbstractPost post;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final subStyle = TextStyle(
      color: Theme.of(context).secondaryHeaderColor,
      fontSize: fontSize - 1,
    );

    return Row(
      spacing: 4,
      children: [
        Flexible(
          child: Text(
            post.author.displayName,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        ...getUserPrimaryMark(post.author, size: fontSize + 2),
        Flexible(
          child: Text(
            "@${post.author.username}",
            style: subStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text("·", style: subStyle),
        Text(getLocalizedDateTime(post.createdAt), style: subStyle),
      ],
    );
  }
}

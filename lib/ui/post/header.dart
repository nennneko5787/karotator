import "package:flutter/material.dart";
import "package:karotator/objects/user.dart";
import "package:karotator/utils.dart";

/// 表示名・公式マーク・ID・投稿時刻の 1 行。
///
/// 表示名だけ太字にして、@ID と時刻は控えめな色で続ける。
/// 幅が足りないときに削るのは @ID の方（表示名は最後まで残す）。
class PostUserDetail extends StatelessWidget {
  const PostUserDetail({
    super.key,
    required this.author,
    required this.createdAt,
    this.fontSize = 12,
  });

  final Author author;
  final DateTime createdAt;
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
            author.displayName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
          ),
        ),
        ...getUserPrimaryMark(author, size: fontSize + 2),
        // 幅が足りないときはここから削る。表示名と時刻は残す。
        Flexible(
          child: Text(
            "@${author.username}",
            style: subStyle,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text("·", style: subStyle),
        Text(getLocalizedDateTime(createdAt), style: subStyle, maxLines: 1),
      ],
    );
  }
}

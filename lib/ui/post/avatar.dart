import "package:flutter/material.dart";
import "package:karotator/const.dart";
import "package:karotator/pages/profile.dart";

/// カロートに添えるアバター。
///
/// [username] を渡したときだけタップでプロフィールへ飛ぶ。投稿画面のように
/// 自分のアバターを飾りとして出す場合は省く。
class PostUserAvatar extends StatelessWidget {
  const PostUserAvatar({super.key, required this.avatarUrl, this.username});

  final String? avatarUrl;
  final String? username;

  @override
  Widget build(BuildContext context) {
    final avatar = CircleAvatar(
      backgroundImage: NetworkImage(avatarUrlOf(avatarUrl)),
    );
    if (username == null) return avatar;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ProfilePage(username: username!)),
      ),
      child: avatar,
    );
  }
}

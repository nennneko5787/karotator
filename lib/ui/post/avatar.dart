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
    final avatar = KarotterAvatar(avatarUrl: avatarUrl);
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

/// 丸いアバター 1 つ。
///
/// **取得に失敗しても既定アイコンに落とすだけで、例外を投げない。**
/// `CircleAvatar` は `onBackgroundImageError` を渡さないと、404 や画像でない
/// 応答のたびに `Exception caught by image resource service` を吐く。
class KarotterAvatar extends StatefulWidget {
  const KarotterAvatar({super.key, required this.avatarUrl, this.radius = 20});

  final String? avatarUrl;
  final double radius;

  @override
  State<KarotterAvatar> createState() => _KarotterAvatarState();
}

class _KarotterAvatarState extends State<KarotterAvatar> {
  bool _failed = false;

  @override
  void didUpdateWidget(KarotterAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 別の人のアバターに差し替わったら、また試す。
    if (oldWidget.avatarUrl != widget.avatarUrl) _failed = false;
  }

  @override
  Widget build(BuildContext context) {
    final url = _failed ? null : widget.avatarUrl;

    return CircleAvatar(
      radius: widget.radius,
      backgroundImage: avatarImageOf(url),
      // 失敗したら同梱の既定アイコンに切り替える。ここで受けないと
      // 画像サービスが例外として報告する。
      onBackgroundImageError: url == null
          ? null
          : (error, stackTrace) {
              if (!mounted || _failed) return;
              setState(() => _failed = true);
            },
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/const.dart";
import "package:karotator/enum.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/post.dart";
import "package:karotator/providers/post.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:share_plus/share_plus.dart";

/// 返信 / リカロート / いいね / ブックマーク / 表示回数 / 共有の一列。
class PostActionsWidget extends ConsumerStatefulWidget {
  const PostActionsWidget({super.key, required this.post});

  final Post post;

  @override
  ConsumerState<PostActionsWidget> createState() => _PostActionsWidgetState();
}

class _PostActionsWidgetState extends ConsumerState<PostActionsWidget> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(postProvider(widget.post.id).notifier).initialize(widget.post);
    });
  }

  /// 未ログインならログイン画面へ送り、そうでなければ [action] を実行する。
  void _requireSignIn(VoidCallback action) {
    if (KarotterApi().session.accountId == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      return;
    }
    action();
  }

  void _showRekarotMenu(PostNotifier notifier, Post post) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: post.rekaroted
                  ? const Icon(Icons.close, color: Colors.red)
                  : const Icon(Icons.repeat),
              title: post.rekaroted
                  ? const Text(
                      "リカロートを取り消す",
                      style: TextStyle(color: Colors.red),
                    )
                  : const Text("リカロート"),
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
                    builder: (_) =>
                        PostPage(post: post, type: InternalPostType.rekarot),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // 表示は全て post を見る。widget.post は初期値でしかなく、
    // いいねやブックマークを押しても更新されない。
    final post = ref.watch(postProvider(widget.post.id));
    final notifier = ref.read(postProvider(widget.post.id).notifier);
    final color = Theme.of(context).secondaryHeaderColor;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _ActionItem(
          icon: Icons.comment_outlined,
          count: post.repliesCount,
          color: color,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  PostPage(post: post, type: InternalPostType.reply),
            ),
          ),
        ),
        _ActionItem(
          icon: Icons.repeat,
          count: post.rekarotsCount,
          color: color,
          activeColor: post.rekaroted ? Colors.lightGreen : null,
          onTap: () => _requireSignIn(() => _showRekarotMenu(notifier, post)),
        ),
        _ActionItem(
          icon: post.liked ? Icons.favorite : Icons.favorite_outline,
          count: post.likesCount,
          color: color,
          activeColor: post.liked ? Colors.red : null,
          onTap: () => _requireSignIn(notifier.toggleLike),
        ),
        _ActionItem(
          icon: post.bookmarked ? Icons.bookmark : Icons.bookmark_outline,
          count: post.bookmarksCount,
          color: color,
          activeColor: post.bookmarked ? Colors.lightBlue : null,
          onTap: () => _requireSignIn(notifier.toggleBookmark),
        ),
        _ActionItem(
          icon: Icons.analytics,
          count: post.viewsCount,
          color: color,
          onTap: () {},
        ),
        _CompactIconButton(
          icon: Icons.ios_share,
          color: color,
          onPressed: () => SharePlus.instance.share(
            ShareParams(
              uri: Uri.https(
                karotterHost,
                "${post.author.username}/status/${post.id}/share",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.icon,
    required this.count,
    required this.color,
    required this.onTap,
    this.activeColor,
  });

  final IconData icon;
  final int count;
  final Color color;
  final Color? activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _CompactIconButton(
          icon: icon,
          color: activeColor ?? color,
          onPressed: onTap,
        ),
        const SizedBox(width: 4),
        Text("$count", style: TextStyle(color: color, fontSize: 12)),
      ],
    );
  }
}

/// 余白を潰した小さなアイコンボタン。カロート 1 件に 6 個並ぶため。
class _CompactIconButton extends StatelessWidget {
  const _CompactIconButton({
    required this.icon,
    required this.color,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 16),
      color: color,
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      visualDensity: VisualDensity.compact,
    );
  }
}

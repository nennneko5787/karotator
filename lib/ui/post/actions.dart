import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/const.dart";
import "package:karotator/enum.dart";
import "package:karotator/objects/permissions.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/pages/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/metrics.dart";
import "package:karotator/providers/post.dart";
import "package:karotator/utils.dart";
import "package:material_symbols_icons/symbols.dart";
import "package:share_plus/share_plus.dart";

/// 返信 / リカロート / いいね / ブックマーク / 表示回数 / 共有の一列。
class PostActionsWidget extends ConsumerStatefulWidget {
  const PostActionsWidget({
    super.key,
    required this.post,
    this.showCounts = true,
  });

  final Post post;

  /// 件数を横に出すか。詳細ページの主役は上に統計バーを別に持つので消す。
  final bool showCounts;

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
  ///
  /// [action] の失敗はここで受ける。投げっぱなしにすると `onTap` の Future が
  /// 捨てられ、未処理例外でデバッガが停止してアプリが固まる。
  Future<void> _requireSignIn(Future<void> Function() action) async {
    if (KarotterApi().session.accountId == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      return;
    }
    await runGuarded(context, action);
  }

  /// リカロートと引用は別々に塞がれる。押せない方は理由を出して無効にする。
  void _showRekarotMenu(
    PostNotifier notifier,
    Post post,
    PostPermissions permissions,
  ) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              enabled: permissions.canRekarot,
              leading: post.rekaroted
                  ? const Icon(Icons.close, color: Colors.red)
                  : const Icon(Icons.repeat),
              title: post.rekaroted
                  ? const Text(
                      "リカロートを取り消す",
                      style: TextStyle(color: Colors.red),
                    )
                  : const Text("リカロート"),
              subtitle: permissions.rekarotDisabledReason == null
                  ? null
                  : Text(permissions.rekarotDisabledReason!),
              onTap: permissions.canRekarot
                  ? () {
                      Navigator.pop(context);
                      // 失敗しても止めない。ここも投げっぱなしにしない。
                      runGuarded(this.context, notifier.toggleRekarot);
                    }
                  : null,
            ),
            ListTile(
              enabled: permissions.canQuote,
              leading: const Icon(Symbols.stylus),
              title: const Text("引用リカロート"),
              subtitle: permissions.quoteDisabledReason == null
                  ? null
                  : Text(permissions.quoteDisabledReason!),
              onTap: permissions.canQuote
                  ? () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostPage(
                            post: post,
                            type: InternalPostType.rekarot,
                          ),
                        ),
                      );
                    }
                  : null,
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
    final metrics = PostMetrics.of(context);

    final showCounts = widget.showCounts;

    // 相互ブロックなどでサーバーが操作を落としていることがある。
    // 判定は PostPermissions に集約（Karotter Web と同じ規則）。
    final permissions = PostPermissions.of(
      post,
      viewerId: KarotterApi().session.userId,
      viewerUsername: KarotterApi().session.username,
    );
    // リカロートと引用のどちらかが通るならメニューは開ける。
    final canOpenRekarotMenu = permissions.canRekarot || permissions.canQuote;

    // 幅いっぱいに広げるとデスクトップでアイコンが散らばる。Twitter と同じで
    // 上限を決めて、それより広いときは左寄せにする。
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: metrics.actionMaxWidth),
      // 各項目は Flexible。幅が足りない端末では数字から削れて、
      // アイコンだけは必ず残る（以前は縮めずにはみ出していた）。
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            // 収まらないときだけ縮む。通常は数字まで出る。
            child: _ActionItem(
              icon: Symbols.chat_bubble,
              count: showCounts ? post.repliesCount : null,
              color: color,
              tooltip: permissions.replyDisabledReason ?? "返信",
              enabled: permissions.canReply,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      PostPage(post: post, type: InternalPostType.reply),
                ),
              ),
            ),
          ),
          Flexible(
            child: _ActionItem(
              icon: Icons.repeat,
              count: showCounts ? post.rekarotsCount : null,
              color: color,
              activeColor: post.rekaroted ? _rekarotColor : null,
              tooltip: canOpenRekarotMenu
                  ? "リカロート"
                  : (permissions.rekarotDisabledReason ?? "リカロートできません"),
              enabled: canOpenRekarotMenu,
              onTap: () => _requireSignIn(
                () async => _showRekarotMenu(notifier, post, permissions),
              ),
            ),
          ),
          Flexible(
            child: _ActionItem(
              icon: post.liked ? Icons.favorite : Icons.favorite_outline,
              count: showCounts ? post.likesCount : null,
              color: color,
              activeColor: post.liked ? _likeColor : null,
              tooltip: permissions.likeDisabledReason ?? "いいね",
              enabled: permissions.canLike,
              onTap: () => _requireSignIn(notifier.toggleLike),
            ),
          ),
          if (showCounts)
            Flexible(
              child: _ActionItem(
                icon: Symbols.bar_chart,
                count: post.viewsCount,
                color: color,
                tooltip: "表示回数",
                onTap: () {},
              ),
            ),
          Flexible(
            child: _ActionItem(
              icon: post.bookmarked ? Icons.bookmark : Icons.bookmark_outline,
              count: null,
              color: color,
              activeColor: post.bookmarked ? _bookmarkColor : null,
              tooltip: "ブックマーク",
              onTap: () => _requireSignIn(notifier.toggleBookmark),
            ),
          ),
          Flexible(
            child: _ActionItem(
              icon: Icons.ios_share,
              count: null,
              color: color,
              tooltip: "共有",
              onTap: () => SharePlus.instance.share(
                ShareParams(
                  uri: Uri.https(
                    karotterHost,
                    "${post.author.username}/status/${post.id}/share",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const _rekarotColor = Color(0xFF00BA7C);
const _likeColor = Color(0xFFF91880);
const _bookmarkColor = Color(0xFF1D9BF0);

/// アイコンと件数の組。押せる範囲はアイコンと数字の両方にかける。
class _ActionItem extends StatelessWidget {
  const _ActionItem({
    required this.icon,
    required this.count,
    required this.color,
    required this.onTap,
    required this.tooltip,
    this.activeColor,
    this.enabled = true,
  });

  final IconData icon;

  /// null なら数字を出さない。
  final int? count;

  final Color color;
  final Color? activeColor;
  final VoidCallback onTap;

  /// 押せないときは理由をそのまま入れる。
  final String tooltip;

  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final metrics = PostMetrics.of(context);
    // 押せないものは薄くして残す。消すと数字まで見えなくなる。
    final effective = enabled
        ? (activeColor ?? color)
        : color.withValues(alpha: 0.4);

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: enabled ? onTap : null,
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          // 詰めて置く。狭い端末で数字が削れるより、全体が小さい方がよい。
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 6),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: metrics.actionIconSize, color: effective),
              if (count != null && count! > 0) ...[
                SizedBox(width: 4 * metrics.scale),
                Text(
                  formatCount(count!),
                  maxLines: 1,
                  style: TextStyle(
                    color: effective,
                    fontSize: metrics.actionFontSize,
                    // 桁が変わっても幅が暴れないようにする。
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

import "package:emoji_picker_flutter/emoji_picker_flutter.dart";
import "package:flutter/foundation.dart" as foundation;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/const.dart";
import "package:karotator/objects/permissions.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/pro_reactions.dart";
import "package:karotator/objects/subscription.dart";
import "package:karotator/pages/login.dart";
import "package:karotator/providers/auth_user.dart";
import "package:karotator/providers/emoji_style.dart";
import "package:karotator/providers/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/metrics.dart";
import "package:karotator/utils.dart";

class ReactionWidget extends ConsumerStatefulWidget {
  final Post post;

  const ReactionWidget({super.key, required this.post});

  @override
  ConsumerState<ReactionWidget> createState() => _ReactionWidgetState();
}

class _ReactionWidgetState extends ConsumerState<ReactionWidget> {
  late final Post post = widget.post;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      ref.read(postProvider(widget.post.id).notifier).initialize(widget.post);
    });
  }

  Future<void> _showEmojiPicker(
    BuildContext context,
    PostNotifier notifier,
    List<ReactionSummary> reactionSummary,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isPro =
        ref.read(authUserProvider)?.effectivePlan == SubscriptionPlan.PRO;

    Future<void> select(String code) async {
      if (KarotterApi().session.accountId == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
        return;
      }

      final existing = reactionSummary
          .where((r) => r.emoji == code)
          .firstOrNull;
      final reacted = existing?.reacted ?? false;

      // PRO でない間は pro リアクションを新たに付けられない。ただし自分が
      // 付けたものは外せる (REQ-RICH-005, 007)。
      if (!canAddReaction(code, isPro: isPro, reacted: reacted)) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("PRO リアクションは PRO プランでのみ付けられます")),
        );
        return;
      }

      if (!context.mounted) return;
      await runGuarded(context, () async {
        if (reacted) {
          await notifier.removeReaction(code);
        } else {
          await notifier.addReaction(code);
        }
      });
    }

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SizedBox(
        height: 420,
        child: Column(
          children: [
            _ProReactionRow(
              isPro: isPro,
              onSelected: (code) {
                Navigator.of(ctx).pop();
                select(code);
              },
            ),
            const Divider(height: 1),
            Expanded(
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) async {
                  Navigator.of(ctx).pop();
                  await select(emoji.emoji);
                },
                config: Config(
                  height: 350,
                  checkPlatformCompatibility: true,
                  locale: Locale("ja", "JP"),
                  // ピッカーもリアクションと同じ絵柄で出す。テーマの
                  // fontFamilyFallback は EmojiPicker に効かないので明示で渡す。
                  emojiTextStyle: TextStyle(
                    fontFamilyFallback: [
                      ?ref.watch(emojiStyleProvider).fontFamily,
                    ],
                  ),
                  emojiViewConfig: EmojiViewConfig(
                    emojiSizeMax:
                        28 *
                        (foundation.defaultTargetPlatform == TargetPlatform.iOS
                            ? 1.2
                            : 1.0),
                    backgroundColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : const Color(0xFFFFFFFF),
                  ),
                  skinToneConfig: const SkinToneConfig(),
                  categoryViewConfig: CategoryViewConfig(
                    backgroundColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : const Color(0xFFFFFFFF),
                    iconColor: isDark ? Colors.grey : Colors.grey,
                    iconColorSelected: isDark ? Colors.white : Colors.blue,
                    indicatorColor: isDark ? Colors.white : Colors.blue,
                  ),
                  bottomActionBarConfig: BottomActionBarConfig(
                    backgroundColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : const Color(0xFFFFFFFF),
                  ),
                  searchViewConfig: SearchViewConfig(
                    backgroundColor: isDark
                        ? const Color(0xFF1E1E1E)
                        : const Color(0xFFFFFFFF),
                    buttonIconColor: isDark ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _toggle(
    PostNotifier notifier,
    ReactionSummary reaction,
    bool canReact,
  ) async {
    if (!canReact) return;
    if (KarotterApi().session.accountId == null) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
      return;
    }

    // 既に付いている pro リアクションのチップを押した場合もここを通る。
    // ピッカーと同じ判定をしないと、PRO でない人が付けにいって 403 になる。
    final isPro =
        ref.read(authUserProvider)?.effectivePlan == SubscriptionPlan.PRO;
    if (!canAddReaction(
      reaction.emoji,
      isPro: isPro,
      reacted: reaction.reacted,
    )) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("PRO リアクションは PRO プランでのみ付けられます")),
      );
      return;
    }

    // 失敗しても画面は止めない。投げっぱなしにするとデバッガが停止する。
    await runGuarded(context, () async {
      if (reaction.reacted) {
        await notifier.removeReaction(reaction.emoji);
      } else {
        await notifier.addReaction(reaction.emoji);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPost = ref.watch(postProvider(post.id));
    final notifier = ref.read(postProvider(post.id).notifier);
    final summary = currentPost.reactionSummary;

    // 相互ブロックなどでリアクションを付けられないことがある。既に付いている
    // ものは出したまま、「追加」だけ引っ込める（Web も同じ）。
    final canReact = PostPermissions.of(
      currentPost,
      viewerId: KarotterApi().session.userId,
      viewerUsername: KarotterApi().session.username,
    ).canReact;

    if (summary.isEmpty) {
      // 1 つも付いていないときは「追加」だけを控えめに出す。以前は常に
      // 大きな枠が出ていて、全てのカロートの下に空の箱が並んでいた。
      if (!canReact) return const SizedBox.shrink();
      return _AddReactionButton(
        compact: true,
        onPressed: () => _showEmojiPicker(context, notifier, summary),
      );
    }

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (final reaction in summary)
          _ReactionChip(
            reaction: reaction,
            enabled: canReact,
            onPressed: () => _toggle(notifier, reaction, canReact),
          ),
        if (canReact)
          _AddReactionButton(
            compact: false,
            onPressed: () => _showEmojiPicker(context, notifier, summary),
          ),
      ],
    );
  }
}

/// 絵文字 1 種類ぶんのピル。押していると色が乗る。
class _ReactionChip extends StatelessWidget {
  const _ReactionChip({
    required this.reaction,
    required this.onPressed,
    this.enabled = true,
  });

  final ReactionSummary reaction;
  final VoidCallback onPressed;

  /// false なら件数の表示だけ。押しても何も起きない。
  final bool enabled;

  static const _accent = Color(0xFF1D9BF0);

  @override
  Widget build(BuildContext context) {
    final reacted = reaction.reacted;
    final subColor = Theme.of(context).secondaryHeaderColor;
    final border = reacted ? _accent : Theme.of(context).dividerColor;
    final metrics = PostMetrics.of(context);
    final height = metrics.reactionHeight;

    return Tooltip(
      // pro リアクションは識別子ではなく日本語名を出す (REQ-RICH-003)。
      message: proReactionOf(reaction.emoji)?.label ?? reaction.emoji,
      child: Material(
        color: reacted ? _accent.withValues(alpha: 0.12) : Colors.transparent,
        borderRadius: BorderRadius.circular(height / 2),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: BorderRadius.circular(height / 2),
          child: Container(
            height: height,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(color: border, width: 1),
              borderRadius: BorderRadius.circular(height / 2),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 5,
              children: [
                ReactionGlyph(code: reaction.emoji, size: 16),
                Text(
                  formatCount(reaction.count),
                  style: TextStyle(
                    fontSize: 12,
                    height: 1,
                    fontWeight: reacted ? FontWeight.w700 : FontWeight.w400,
                    color: reacted ? _accent : subColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// リアクションを足すボタン。[compact] なら枠を出さずアイコンだけ。
class _AddReactionButton extends StatelessWidget {
  const _AddReactionButton({required this.compact, required this.onPressed});

  final bool compact;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final subColor = Theme.of(context).secondaryHeaderColor;
    final height = PostMetrics.of(context).reactionHeight;

    if (compact) {
      return Tooltip(
        message: "リアクションを追加",
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(999),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Icon(Icons.add_reaction_outlined, size: 18, color: subColor),
          ),
        ),
      );
    }

    return Tooltip(
      message: "リアクションを追加",
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(height / 2),
        child: Container(
          height: height,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).dividerColor, width: 1),
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Icon(Icons.add_reaction_outlined, size: 16, color: subColor),
        ),
      ),
    );
  }
}

/// リアクション 1 つぶんの絵柄。
///
/// `pro:otsukaresama` のようなカスタムリアクションは画像で出す。
/// 通常の絵文字はテーマの `fontFamilyFallback` に任せる（絵文字の設定が効く）。
///
/// 仕様: specs/005-rich-text/design.md §4 (REQ-RICH-001, 002)
class ReactionGlyph extends StatelessWidget {
  const ReactionGlyph({super.key, required this.code, this.size = 16});

  final String code;
  final double size;

  @override
  Widget build(BuildContext context) {
    final pro = proReactionOf(code);
    if (pro == null) {
      return Text(code, style: TextStyle(fontSize: size));
    }

    return Image.network(
      karotterUrl(pro.assetUrl),
      height: size,
      // 画像が出せないときは名前で代替する。識別子は出さない。
      errorBuilder: (context, error, stackTrace) =>
          Text(pro.label, style: TextStyle(fontSize: size * 0.8)),
    );
  }
}

/// 絵文字ピッカーの上に足す pro リアクションの段 (REQ-RICH-004)。
///
/// PRO でないときは並べても押せないので、段ごと出さずに案内だけ出す。
class _ProReactionRow extends StatelessWidget {
  const _ProReactionRow({required this.isPro, required this.onSelected});

  final bool isPro;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    final subColor = Theme.of(context).secondaryHeaderColor;

    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Row(
            spacing: 6,
            children: [
              Icon(Icons.workspace_premium, size: 16, color: subColor),
              Text(
                "PRO リアクション",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: subColor,
                ),
              ),
            ],
          ),
          if (!isPro)
            Text(
              "PRO プランに加入すると使えます。",
              style: TextStyle(fontSize: 12, color: subColor),
            )
          else
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: proReactions.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final reaction = proReactions[index];
                  return Tooltip(
                    message: reaction.label,
                    child: InkWell(
                      onTap: () => onSelected(reaction.code),
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: ReactionGlyph(code: reaction.code, size: 28),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

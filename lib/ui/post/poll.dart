import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/permissions.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/providers/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class PollWidget extends ConsumerStatefulWidget {
  final Post post;

  const PollWidget({super.key, required this.post});

  @override
  ConsumerState<PollWidget> createState() => _PollWidgetState();
}

class _PollWidgetState extends ConsumerState<PollWidget> {
  late final Post post = widget.post;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;

      ref.read(postProvider(widget.post.id).notifier).initialize(widget.post);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPost = ref.watch(postProvider(post.id));
    final notifier = ref.read(postProvider(post.id).notifier);

    final poll = currentPost.poll;
    if (poll == null) return const SizedBox.shrink();

    final permissions = PostPermissions.of(
      currentPost,
      viewerId: KarotterApi().session.userId,
      viewerUsername: KarotterApi().session.username,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        for (final option in poll.options)
          _PollOptionRow(
            option: option,
            canVote: permissions.canVote,
            // 締め切り直後などで弾かれることがある。投げっぱなしにしない。
            onVote: () => runGuarded(context, () => notifier.poll(option.id)),
          ),
        // 残り時間は日時から出すが、終了はサーバーの isExpired を優先する
        // （端末の時計がずれていても「終了」と出せるように）。
        Text(
          "${formatCount(poll.totalVotes)}票 · "
          "${poll.isExpired ? "終了" : getRemainingTime(poll.expiresAt)}",
          style: TextStyle(
            fontSize: 12,
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
      ],
    );
  }
}

/// 選択肢 1 つ。ゲージは常に出す。
///
/// Karotter Web も投票前から `width: ${percentage}%` のバーを描いていて、
/// 投票できるかどうかはボタンの `disabled` だけで表している。
class _PollOptionRow extends StatelessWidget {
  const _PollOptionRow({
    required this.option,
    required this.canVote,
    required this.onVote,
  });

  final PollOption option;
  final bool canVote;
  final Future<void> Function() onVote;

  static const _accent = Color(0xFF1D9BF0);
  static const double _radius = 50;

  @override
  Widget build(BuildContext context) {
    // ゲージは薄いティントにする。濃く塗ると、満杯のときに文字が塗りに
    // 埋もれて何パーセントか読めなくなる（文字色は塗りの有無で変えられない
    // ので、塗りの方を文字が乗る前提の濃さにする）。
    final fill = _accent.withValues(alpha: option.votedByMe ? 0.28 : 0.14);
    final border = option.votedByMe ? _accent : Theme.of(context).dividerColor;

    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_radius),
              child: FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: (option.percentage / 100).clamp(0.0, 1.0),
                child: ColoredBox(color: fill),
              ),
            ),
          ),
          OutlinedButton(
            onPressed: canVote ? () async => onVote() : null,
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.transparent,
              side: BorderSide(color: border, width: 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(_radius),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              // 押せないときも文字は読めるままにする。
              disabledForegroundColor: DefaultTextStyle.of(context).style.color,
              foregroundColor: DefaultTextStyle.of(context).style.color,
            ),
            // 選択肢名を Expanded で伸ばして % を右端に寄せる。
            // Flexible と Spacer を混ぜると、空き幅が両者に分けられたうえで
            // 実寸で詰め直されるため、余りが末尾に残って % が中央に落ちる。
            child: Row(
              spacing: 6,
              children: [
                Expanded(
                  child: Text(
                    option.text,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: option.votedByMe
                          ? FontWeight.w700
                          : FontWeight.w400,
                    ),
                  ),
                ),
                if (option.votedByMe)
                  const Icon(Icons.check_circle, size: 16, color: _accent),
                Text(
                  "${option.percentage}%",
                  style: TextStyle(
                    fontWeight: option.votedByMe
                        ? FontWeight.w700
                        : FontWeight.w400,
                    // 桁が変わっても右端が揃うように等幅数字にする。
                    fontFeatures: const [FontFeature.tabularFigures()],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

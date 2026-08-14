import "package:flutter/material.dart";
import "package:material_symbols_icons/symbols.dart";

/// 投稿画面の下端に並ぶ操作。
///
/// 押されたら何をするかは投稿画面が決める。ここは並べるだけ。
class ComposerToolbar extends StatelessWidget {
  const ComposerToolbar({
    super.key,
    required this.controller,
    required this.maxLength,
    required this.onVisibility,
    required this.onReplyRestriction,
    required this.onPickImages,
    required this.onPickVideo,
    required this.onTogglePoll,
    required this.onSchedule,
    required this.onContentDisclosure,
    this.scheduled = false,
    this.pollOpen = false,
    this.disclosed = false,
  });

  /// 文字数を数えるため。本文が変わったときだけカウンタを作り直す。
  final TextEditingController controller;
  final int maxLength;

  final VoidCallback onVisibility;
  final VoidCallback onReplyRestriction;
  final VoidCallback onPickImages;
  final VoidCallback onPickVideo;
  final VoidCallback onTogglePoll;
  final VoidCallback onSchedule;
  final VoidCallback onContentDisclosure;

  /// 設定済みのものは色を変えて分かるようにする。
  final bool scheduled;
  final bool pollOpen;
  final bool disclosed;

  @override
  Widget build(BuildContext context) {
    final active = Colors.lightBlue;

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: BottomAppBar(
        child: Row(
          children: [
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onVisibility,
                      tooltip: "公開範囲",
                      icon: const Icon(Icons.visibility),
                    ),
                    IconButton(
                      onPressed: onReplyRestriction,
                      tooltip: "返信可能なユーザーの範囲",
                      icon: const Icon(Icons.comment),
                    ),
                    IconButton(
                      onPressed: onPickImages,
                      tooltip: "画像を添付",
                      icon: const Icon(Icons.image_outlined),
                    ),
                    IconButton(
                      onPressed: onPickVideo,
                      tooltip: "動画を添付",
                      icon: const Icon(Icons.movie),
                    ),
                    IconButton(
                      onPressed: onTogglePoll,
                      tooltip: "投票",
                      icon: const Icon(Icons.how_to_vote),
                      color: pollOpen ? active : null,
                    ),
                    IconButton(
                      onPressed: onSchedule,
                      tooltip: "予約投稿",
                      icon: const Icon(Symbols.calendar_clock),
                      color: scheduled ? active : null,
                    ),
                    IconButton(
                      onPressed: onContentDisclosure,
                      tooltip: "コンテンツ開示",
                      icon: const Icon(Icons.verified),
                      color: disclosed ? active : null,
                    ),
                  ],
                ),
              ),
            ),
            ListenableBuilder(
              listenable: controller,
              builder: (context, _) {
                final length = controller.text.length;
                return Text(
                  '$length / $maxLength',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: length > maxLength ? Colors.red : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

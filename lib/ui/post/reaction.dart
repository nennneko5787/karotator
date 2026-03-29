import "package:emoji_picker_flutter/emoji_picker_flutter.dart";
import "package:flutter/foundation.dart" as foundation;
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/providers/post.dart";

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

    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SizedBox(
        height: 350,
        child: EmojiPicker(
          onEmojiSelected: (category, emoji) async {
            Navigator.of(ctx).pop();
            final existing = reactionSummary
                .where((r) => r.emoji == emoji.emoji)
                .firstOrNull;
            if (existing != null && existing.reacted) {
              await notifier.removeReaction(emoji.emoji);
            } else {
              await notifier.addReaction(emoji.emoji);
            }
          },
          config: Config(
            height: 350,
            checkPlatformCompatibility: true,
            locale: Locale("ja", "JP"),
            emojiTextStyle: TextStyle(fontFamily: "NotoColorEmoji"),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final currentPost = ref.watch(postProvider(post.id));
    final notifier = ref.read(postProvider(post.id).notifier);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (var reaction in currentPost.reactionSummary)
          OutlinedButton(
            onPressed: () async {
              if (reaction.reacted) {
                await notifier.removeReaction(reaction.emoji);
              } else {
                await notifier.addReaction(reaction.emoji);
              }
            },
            style: OutlinedButton.styleFrom(
              minimumSize: Size.zero,
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              textStyle: const TextStyle(fontSize: 18),
              foregroundColor: (!reaction.reacted)
                  ? Theme.of(context).secondaryHeaderColor
                  : null,
              side: (!reaction.reacted)
                  ? BorderSide(color: Theme.of(context).secondaryHeaderColor)
                  : null,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                Text(
                  reaction.emoji,
                  style: TextStyle(fontFamily: "NotoColorEmoji"),
                ),
                Text(reaction.count.toString(), style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
        OutlinedButton(
          onPressed: () =>
              _showEmojiPicker(context, notifier, currentPost.reactionSummary),
          style: OutlinedButton.styleFrom(
            minimumSize: Size.zero,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            textStyle: const TextStyle(fontSize: 18),
            foregroundColor: Theme.of(context).secondaryHeaderColor,
            side: BorderSide(color: Theme.of(context).secondaryHeaderColor),
          ),
          child: const Icon(Icons.add_reaction),
        ),
      ],
    );
  }
}

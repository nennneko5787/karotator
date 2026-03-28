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
                Text(reaction.emoji),
                Text(reaction.count.toString(), style: TextStyle(fontSize: 12)),
              ],
            ),
          ),
      ],
    );
  }
}

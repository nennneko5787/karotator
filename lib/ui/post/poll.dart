import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/providers/post.dart";
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

    if (currentPost.poll == null) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var option in currentPost.poll!.options) ...[
          SizedBox(
            width: double.infinity,
            child:
                (currentPost.poll!.ownVoteOptionId != null ||
                    currentPost.poll!.isExpired)
                ? Stack(
                    children: [
                      Positioned.fill(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: option.percentage / 100,
                            child: Container(
                              color: Theme.of(context)
                                  .outlinedButtonTheme
                                  .style!
                                  .side!
                                  .resolve({})!
                                  .color,
                            ),
                          ),
                        ),
                      ),
                      OutlinedButton(
                        onPressed: currentPost.poll!.isExpired
                            ? null
                            : () async {
                                await notifier.poll(option.id);
                              },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${option.text} ",
                              style: TextStyle(color: Colors.white),
                            ),
                            if (option.votedByMe)
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                            const Spacer(),
                            Text("${option.percentage}% "),
                          ],
                        ),
                      ),
                    ],
                  )
                : ElevatedButton(
                    onPressed: currentPost.poll!.isExpired
                        ? null
                        : () async {
                            await notifier.poll(option.id);
                          },
                    child: Text(option.text),
                  ),
          ),
          SizedBox(height: 8),
        ],
        Text(
          "${currentPost.poll!.totalVotes}票 · ${getRemainingTime(currentPost.poll!.expiresAt)}",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

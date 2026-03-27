import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/state.dart";
import "package:karotator/providers/poll.dart";
import "package:karotator/utils.dart";

class PollWidget extends ConsumerWidget {
  final Post post;

  const PollWidget({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pollState = PollState(id: post.id, poll: post.poll!);
    final currentPoll = ref.watch(pollProvider(pollState));
    final notifier = ref.read(pollProvider(pollState).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var option in currentPoll.poll.options) ...[
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                await notifier.poll(option.id);
              },
              child: (currentPoll.poll.ownVoteOptionId != null)
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${option.text} "),
                        if (option.votedByMe) const Icon(Icons.check_circle),
                        Spacer(),
                        Text("${option.percentage}% "),
                      ],
                    )
                  : Text(option.text),
            ),
          ),
          SizedBox(height: 8),
        ],
        Text(
          "${currentPoll.poll.totalVotes}票 · ${getRemainingTime(currentPoll.poll.expiresAt)}",
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}

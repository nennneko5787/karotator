import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/utils.dart";

Widget pollFactory(Post post) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      for (var i = 0; i < post.poll!.options.length; i++) ...[
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(post.poll!.options[i].text),
          ),
        ),
        SizedBox(height: 8),
      ],
      Text(
        "${post.poll!.totalVotes}票 · ${getRemainingTime(post.poll!.expiresAt)}",
        style: TextStyle(fontSize: 12),
      ),
    ],
  );
}

import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";

Widget pollFactory(Post post) {
  return Column(
    children: [
      for (var option in post.poll!.options)
        ElevatedButton(onPressed: () => {}, child: Text(option.text)),
    ],
  );
}

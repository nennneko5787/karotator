import "package:flutter/material.dart";

class PostThread extends StatefulWidget {
  const PostThread({super.key});

  @override
  State<PostThread> createState() => _PostThreadState();
}

class _PostThreadState extends State<PostThread> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("(=^・ω・^=)", style: TextStyle(fontSize: 32)),
          Text("未実装です"),
        ],
      ),
    );
  }
}

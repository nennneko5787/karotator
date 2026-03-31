import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/board.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class ThreadPage extends StatefulWidget {
  const ThreadPage({super.key, required this.thread, required this.board});
  final Thread thread;
  final Board board;

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  late final Thread thread = widget.thread;
  late final Board board = widget.board;

  List<ThreadReply> replies = [];
  late Future<void> initThreadData;

  @override
  void initState() {
    super.initState();
    initThreadData = refreshThread();
  }

  Future<void> refreshThread() async {
    try {
      final repliesList = await HTTPClient().getThreadReplies(
        slug: board.slug,
        threadId: thread.id,
      );

      setState(() {
        replies.addAll(repliesList);
      });
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${thread.title} - ${board.title}")),
      body: RefreshIndicator(
        onRefresh: refreshThread,
        child: FutureBuilder(
          future: initThreadData,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.error != null) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(8),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: replies.length,
              itemBuilder: (context, index) {
                final reply = replies[index];

                String getYMD() {
                  return "${reply.createdAt.year}/${reply.createdAt.month}/${reply.createdAt.day} ${reply.createdAt.hour}:${reply.createdAt.minute}";
                }

                return ListTile(
                  title: Text(
                    "#${index + 1} ${reply.author.displayName} @${reply.author.username} ${getYMD()}",
                  ),
                  subtitle: Text(reply.content),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

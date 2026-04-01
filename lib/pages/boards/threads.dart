import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/board.dart";
import "package:karotator/pages/boards/post.dart";
import "package:karotator/pages/boards/thread.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class ThreadsPage extends StatefulWidget {
  const ThreadsPage({super.key, required this.board});
  final Board board;

  @override
  State<ThreadsPage> createState() => _ThreadsPageState();
}

class _ThreadsPageState extends State<ThreadsPage> {
  late final Board board = widget.board;

  List<Thread> threads = [];
  late Future<void> initThreadsData;

  @override
  void initState() {
    super.initState();
    initThreadsData = refreshThreads();
  }

  Future<void> refreshThreads() async {
    try {
      final threadsList = await HTTPClient().getThreads(slug: board.slug);

      setState(() {
        threads.addAll(threadsList);
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
      appBar: AppBar(title: Text(board.title)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PostThread()),
          ),
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: refreshThreads,
        child: FutureBuilder(
          future: initThreadsData,
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
              itemCount: threads.length,
              itemBuilder: (context, index) {
                final thread = threads[index];

                String getYMD() {
                  return "${thread.createdAt.year}/${thread.createdAt.month}/${thread.createdAt.day} ${thread.createdAt.hour}:${thread.createdAt.minute}";
                }

                final child = ListTile(
                  title: Text(thread.title),
                  subtitle: Text(
                    "${thread.replyCount}件　${thread.author.displayName}　投稿日 ${getYMD()}　最終返信 ${getLocalizedDateTime(thread.lastReplyAt)}",
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (parentContext) =>
                            ThreadPage(board: board, thread: thread),
                      ),
                    );
                  },
                );

                if (index != 0 && index != threads.length) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [const Divider(height: 1, thickness: 1), child],
                  );
                }

                return child;
              },
            );
          },
        ),
      ),
    );
  }
}

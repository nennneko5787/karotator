import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/board.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/ui/dialog.dart";

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

      replies.clear();

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
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: _ReplyInput(
          board: board,
          thread: thread,
          onPosted: refreshThread,
        ),
      ),
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

                final child = ListTile(
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 8,
                    children: [
                      Text("#${index + 1}"),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProfilePage(username: reply.author.username),
                            ),
                          );
                        },
                        iconSize: 10,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: CircleAvatar(
                          radius: 10,
                          backgroundImage: NetworkImage(
                            reply.author.avatarUrl != null
                                ? "https://karotter.com${reply.author.avatarUrl}"
                                : "https://karotter.com/default-avatar.png",
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          reply.author.displayName,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          "@${reply.author.username}",
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(getYMD()),
                    ],
                  ),
                  subtitle: Text(reply.content),
                );

                if (index != 0 && index != replies.length) {
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

class _ReplyInput extends StatefulWidget {
  const _ReplyInput({
    required this.board,
    required this.thread,
    required this.onPosted,
  });

  final Board board;
  final Thread thread;
  final VoidCallback onPosted;

  @override
  State<_ReplyInput> createState() => _ReplyInputState();
}

class _ReplyInputState extends State<_ReplyInput> {
  final TextEditingController _controller = TextEditingController();
  bool _isPosting = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _post() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isPosting) return;

    setState(() => _isPosting = true);
    try {
      await HTTPClient().replyThread(
        text,
        slug: widget.board.slug,
        threadId: widget.thread.id,
      );
      _controller.clear();
      widget.onPosted();
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;
      showAlert(context, e: e);
    } finally {
      if (mounted) setState(() => _isPosting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              maxLines: null,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: "返信を入力...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          _isPosting
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : IconButton.filled(
                  onPressed: _post,
                  icon: const Icon(Icons.send),
                ),
        ],
      ),
    );
  }
}

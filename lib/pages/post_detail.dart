import "package:flutter/material.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/post/post.dart";

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({super.key, required this.post});

  final Post post;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late List<Post> posts = [];
  Post? parentPost;
  late Future<void> initPostsData;
  late ScrollController controller;
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = true;

  @override
  void initState() {
    super.initState();

    controller = ScrollController()..addListener(onScroll);

    initPostsData = refreshPosts();
  }

  void onScroll() {
    if (!controller.hasClients || isLoadingMore || !hasMore) return;

    final threshold = 200.0; // 下から200pxで発火
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - threshold) {
      loadMore();
    }
  }

  Future<void> loadMore() async {
    try {
      isLoadingMore = true;
      page++;

      final response = await HTTPClient().getReplies(
        postId: widget.post.id,
        page: page,
        limit: 20,
      );

      setState(() {
        if (response.replies.isEmpty) {
          hasMore = false;
        } else {
          posts.addAll(response.replies);
        }
      });

      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  Future<void> refreshPosts() async {
    try {
      isLoadingMore = true;

      if (widget.post.parentId != null) {
        final parent = await HTTPClient().getPostById(widget.post.parentId!);
        setState(() {
          parentPost = parent;
        });
      }

      final response = await HTTPClient().getReplies(
        postId: widget.post.id,
        page: 1,
        limit: 20,
      );
      setState(() {
        posts = List<Post>.from(response.replies);
        hasMore = response.replies.length >= 20;
      });
      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("カロート"), centerTitle: true),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: _ReplyInput(postId: widget.post.id, onPosted: refreshPosts),
      ),
      body: RefreshIndicator(
        onRefresh: refreshPosts,
        child: FutureBuilder(
          future: initPostsData,
          builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.error != null) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            final allItems = [?parentPost, widget.post, ...posts];

            return ListView.builder(
              controller: controller,
              padding: const EdgeInsets.all(8),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: allItems.length + 1,
              itemBuilder: (context, index) {
                final mainPostIndex = parentPost != null ? 1 : 0;

                if (index == allItems.length) {
                  return hasMore
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }

                final post = allItems[index];
                final isParent = parentPost != null && index == 0;
                final isHeader = index == mainPostIndex;

                // グループA: parent + メイン投稿
                final groupAFirst = index == 0;
                final groupALast = index == mainPostIndex;
                // グループB: 返信
                final groupBFirst = index == mainPostIndex + 1;
                final groupBLast = index == allItems.length - 1;

                final computedIsFirst = (isHeader || isParent)
                    ? groupAFirst
                    : false;
                final computedIsLast = (isHeader || isParent)
                    ? (isHeader ? false : groupALast)
                    : groupBLast;

                final child = PostWidget(
                  key: ValueKey('post_${post.id}_${allItems.length}'),
                  post: post,
                  isFirst: computedIsFirst,
                  isLast: computedIsLast,
                  fontSize: isHeader ? 14 : 12,
                  disablePageTransition: isHeader,
                );

                // 返信の先頭に区切り線
                if (groupBFirst) {
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
  const _ReplyInput({required this.postId, required this.onPosted});

  final int postId;
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
      await HTTPClient().createPost(text, parentId: widget.postId);
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

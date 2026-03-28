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

            // ヘッダーをリストの先頭に含める
            final allItems = [?parentPost, widget.post, ...posts];

            return ListView.builder(
              controller: controller,
              padding: const EdgeInsets.all(8),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: allItems.length + 1, // +1はローディング用
              itemBuilder: (context, index) {
                // ローディング or 終端
                if (index == allItems.length) {
                  return hasMore
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }

                final post = allItems[index];
                final headerIndex = parentPost != null ? 0 : 1;
                final isHeader = index == headerIndex;
                final isFirst = index == headerIndex;
                final isLast = index == allItems.length - 1;

                return Padding(
                  padding: EdgeInsets.only(bottom: isHeader ? 8 : 0),
                  child: PostWidget(
                    key: ValueKey('post_${post.id}_${allItems.length}'),
                    post: post,
                    isFirst: isFirst,
                    isLast: isLast,
                    fontSize: isHeader ? 14 : 12,
                    disablePageTransition: isHeader,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/objects/response.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/post/post.dart";

class TimeLineTab extends StatefulWidget {
  final Future<dynamic> Function(int? page, int limit) fetcher;
  final bool isRecLatest;

  const TimeLineTab({
    super.key,
    required this.fetcher,
    this.isRecLatest = false,
  });

  @override
  State<TimeLineTab> createState() => _TimeLineTabState();
}

class _TimeLineTabState extends State<TimeLineTab> {
  late List<Post> posts = [];
  late Future<void> initPostsData;
  late ScrollController controller;
  int page = 1;
  int? cursor;
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

      if (widget.isRecLatest) {
        RecommendedResponseLatest response = await widget.fetcher(cursor, 12);

        setState(() {
          posts.addAll(response.posts);
          cursor = response.pagination.nextCursor;
          hasMore = response.pagination.hasNext;
        });
      } else {
        final response = await widget.fetcher(page, 12);

        setState(() {
          if (response.posts.isEmpty) {
            hasMore = false;
          } else {
            posts.addAll(response.posts);
          }
        });
      }

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

      if (widget.isRecLatest) {
        RecommendedResponseLatest response = await widget.fetcher(cursor, 12);
        setState(() {
          posts = List<Post>.from(response.posts);
          cursor = response.pagination.nextCursor;
          hasMore = response.pagination.hasNext;
        });
      } else {
        final response = await widget.fetcher(1, 12);
        setState(() {
          posts = List<Post>.from(response.posts);
          hasMore = response.posts.length >= 12;
        });
      }

      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initPostsData,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) {
          return Center(child: Text('I got the error! ${snapshot.error}'));
        }

        return RefreshIndicator(
          onRefresh: refreshPosts,
          child: ListView.builder(
            controller: controller,
            padding: const EdgeInsets.all(8),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: posts.length + 1,
            itemBuilder: (context, index) {
              if (index == posts.length) {
                return hasMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox.shrink();
              }

              final post = posts[index];
              final isFirst = index == 0;
              final isLast = index == posts.length - 1;

              return PostWidget(
                key: ValueKey('post_${post.id}_${posts.length}'),
                post: post,
                isFirst: isFirst,
                isLast: isLast,
              );
            },
          ),
        );
      },
    );
  }
}

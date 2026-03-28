import "package:flutter/material.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/post/post.dart";
import "package:karotator/ui/tab_bar_delegate.dart";

class ProfileTab extends StatefulWidget {
  final Future<dynamic> Function(int page, int limit) fetcher;
  final QuotedPost? pinnedPost;
  final Widget header;
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  const ProfileTab({
    super.key,
    required this.fetcher,
    required this.header,
    required this.selectedTab,
    required this.onTabChanged,
    this.pinnedPost,
  });

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab>
    with AutomaticKeepAliveClientMixin {
  List<Post> posts = [];
  late Future<void> initPostsData;
  late ScrollController controller;
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(onScroll);
    initPostsData = refreshPosts();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    if (!controller.hasClients || isLoadingMore || !hasMore) return;
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 200) {
      loadMore();
    }
  }

  Future<void> loadMore() async {
    if (isLoadingMore || !hasMore) return;
    try {
      setState(() => isLoadingMore = true);
      page++;
      final response = await widget.fetcher(page, 12);
      setState(() {
        if (response.posts.isEmpty) {
          hasMore = false;
        } else {
          posts.addAll(List<Post>.from(response.posts));
        }
        isLoadingMore = false;
      });
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      setState(() => isLoadingMore = false);
      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  Future<void> refreshPosts() async {
    try {
      final response = await widget.fetcher(1, 12);
      setState(() {
        posts = List<Post>.from(response.posts);
        hasMore = response.posts.length >= 12;
        page = 1;
      });
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");
      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  @override
  void didUpdateWidget(ProfileTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fetcher != widget.fetcher) {
      page = 1;
      hasMore = true;
      initPostsData = refreshPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final showedPosts = [?widget.pinnedPost, ...posts];

    return FutureBuilder(
      future: initPostsData,
      builder: (context, snapshot) {
        return RefreshIndicator(
          onRefresh: refreshPosts,
          child: CustomScrollView(
            controller: controller,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              // プロフィールヘッダー
              SliverToBoxAdapter(child: widget.header),
              // タブバー（固定）
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarDelegate(
                  TabBar(
                    onTap: widget.onTabChanged,
                    tabs: const [
                      Tab(text: 'カロート'),
                      Tab(text: '返信'),
                      Tab(text: 'メディア'),
                      Tab(text: 'いいね'),
                    ],
                  ),
                ),
              ),
              // ローディング中
              if (snapshot.connectionState == ConnectionState.waiting)
                const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (snapshot.hasError)
                SliverFillRemaining(
                  child: Center(child: Text('エラー: ${snapshot.error}')),
                )
              else
                SliverList.builder(
                  itemCount: showedPosts.length + 1,
                  itemBuilder: (context, index) {
                    if (index == showedPosts.length) {
                      return hasMore
                          ? const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : const SizedBox.shrink();
                    }
                    final post = showedPosts[index];
                    return PostWidget(
                      key: ValueKey('post_${post.id}_${showedPosts.length}'),
                      post: post,
                      isFirst: index == 0,
                      isLast: index == showedPosts.length - 1,
                      pinned: post is QuotedPost,
                    );
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}

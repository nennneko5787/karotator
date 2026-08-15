import "package:flutter/material.dart";
import "package:karotator/const.dart";
import "package:karotator/objects/media.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/post/hidden.dart";
import "package:karotator/ui/post/media.dart";
import "package:karotator/ui/post/post.dart";
import "package:karotator/ui/post/preview.dart";
import "package:karotator/ui/metrics.dart";
import "package:karotator/ui/post/row.dart";
import "package:karotator/ui/tab_bar_delegate.dart";

class ProfileTab extends StatefulWidget {
  final Future<dynamic> Function(int page, int limit) fetcher;

  /// 固定ポスト。引用元と同じプレビューで、非表示のこともある。
  final Quote? pinnedPost;
  final Widget header;
  final int selectedTab;
  final ValueChanged<int> onTabChanged;

  /// 取得した中から出すものを選ぶ。null なら全部出す。
  final bool Function(Post post)? filter;

  /// カロート行ではなくサムネイルのマス目で出す。メディア欄で使う。
  final bool asMediaGrid;

  const ProfileTab({
    super.key,
    required this.fetcher,
    required this.header,
    required this.selectedTab,
    required this.onTabChanged,
    this.pinnedPost,
    this.filter,
    this.asMediaGrid = false,
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

  /// 画面に出すぶんだけ残す。
  ///
  /// メディア欄は `GET /users/{id}/media` を叩いているが、メディアを持たない
  /// カロートも混ざって返る。Karotter Web も同じ絞り込みをクライアント側で
  /// している（音声だけの添付は数えない）。
  List<Post> _visible(List<Post> fetched) {
    if (widget.filter == null) return fetched;
    return fetched.where(widget.filter!).toList();
  }

  Future<void> loadMore() async {
    if (isLoadingMore || !hasMore) return;
    try {
      setState(() => isLoadingMore = true);
      page++;
      final response = await widget.fetcher(page, 12);
      final fetched = List<Post>.from(response.posts);
      setState(() {
        if (fetched.isEmpty) {
          hasMore = false;
        } else {
          // 続きがあるかは**絞り込む前**の件数で決める。絞った結果が
          // 0 件でも、次のページには残っているかもしれない。
          posts.addAll(_visible(fetched));
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
      final fetched = List<Post>.from(response.posts);
      setState(() {
        posts = _visible(fetched);
        hasMore = fetched.length >= 12;
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
    if (oldWidget.selectedTab != widget.selectedTab) {
      page = 1;
      hasMore = true;
      initPostsData = refreshPosts();
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
              else ...[
                // 固定ポストはプレビューなので一覧のカロートとは別枠で描く。
                // 以前は `post is QuotedPost` を「固定の印」に使っていたが、
                // 型で意味を表すのをやめた (REQ-HIDE-009)。
                if (widget.pinnedPost case final pinned?)
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).dividerColor,
                            width: 1,
                          ),
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: PostMetrics.of(context).horizontalPadding,
                        vertical: PostMetrics.of(context).verticalPadding,
                      ),
                      child: PostPreviewCard(
                        quote: pinned,
                        label: const PostRowLabel(
                          icon: Icons.push_pin,
                          text: "固定されたポスト",
                        ),
                      ),
                    ),
                  ),
                if (widget.asMediaGrid)
                  // メディア欄はサムネイルを敷き詰める。Karotter Web も
                  // ここだけカロート行ではなくマス目で出している。
                  SliverGrid.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 2,
                          mainAxisSpacing: 2,
                        ),
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      // 1 件につき先頭の画像か動画を 1 枚だけ出す。
                      final first = attachmentsOf(
                        post.mediaUrls,
                        post.mediaTypes,
                      ).where((a) => !a.isAudio).firstOrNull;
                      if (first == null) return const SizedBox.shrink();

                      return GestureDetector(
                        onTap: () => openPostDetail(context, post.id),
                        child: PostMediaThumbnail(
                          url: karotterUrl(first.url),
                          isVideo: first.isVideo,
                        ),
                      );
                    },
                  )
                else
                  SliverList.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      final post = posts[index];
                      return PostWidget(
                        key: ValueKey('post_${post.id}_${posts.length}'),
                        post: post,
                      );
                    },
                  ),
                if (hasMore)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  ),
              ],
            ],
          ),
        );
      },
    );
  }
}

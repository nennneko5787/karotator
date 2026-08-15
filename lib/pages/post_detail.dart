import "package:flutter/material.dart";
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/permissions.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/ui/post/focused.dart";
import "package:karotator/ui/post/hidden.dart";
import "package:karotator/ui/post/post.dart";
import "package:karotator/ui/metrics.dart";

class PostDetailPage extends StatefulWidget {
  const PostDetailPage({
    super.key,
    required this.post,
    this.revealMutedOrBlocked = false,
  });

  final Post post;

  /// 閲覧者が「表示する」を押してここへ来た。親カロートや引用元にも引き継ぐ
  /// (REQ-HIDE-015)。
  final bool revealMutedOrBlocked;

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  late List<Post> posts = [];

  /// 親カロート。閲覧者に見せられないこともある (REQ-HIDE-007)。
  PostResult? parentPost;
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

      final response = await KarotterApi().posts.replies(
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
        final parent = await KarotterApi().posts.byId(
          widget.post.parentId!,
          includeMutedOrBlocked: widget.revealMutedOrBlocked,
        );
        setState(() {
          parentPost = parent;
        });
      }

      final response = await KarotterApi().posts.replies(
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
    final permissions = PostPermissions.of(
      widget.post,
      viewerId: KarotterApi().session.userId,
      viewerUsername: KarotterApi().session.username,
    );

    return Scaffold(
      appBar: AppBar(title: const Text("カロート"), centerTitle: true),
      // 返信できないカロートでは入力欄を出さず、理由を出す。Web も
      // canInteract が false のときは入力欄ごと差し替えている。
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: permissions.canReply
            ? _ReplyInput(postId: widget.post.id, onPosted: refreshPosts)
            : _ReplyBlocked(
                reason: permissions.replyDisabledReason ?? "このカロートには返信できません",
              ),
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

            // 親カロート → 主役 → 返信、の順に縦線で繋ぐ。
            // 主役と返信の間は線を引かない（Twitter と同じ）。
            final parent = parentPost;
            final leading = parent == null ? 0 : 1;

            return ListView.builder(
              controller: controller,
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: leading + 1 + posts.length + 1,
              itemBuilder: (context, index) {
                if (parent != null && index == 0) {
                  return _ParentPost(
                    parent: parent,
                    revealMutedOrBlocked: widget.revealMutedOrBlocked,
                    onRevealed: (revealed) =>
                        setState(() => parentPost = revealed),
                  );
                }

                if (index == leading) {
                  return FocusedPostWidget(
                    key: ValueKey('focused_${widget.post.id}'),
                    post: widget.post,
                    connectorAbove: parent != null,
                    revealMutedOrBlocked: widget.revealMutedOrBlocked,
                  );
                }

                final replyIndex = index - leading - 1;
                if (replyIndex >= posts.length) {
                  return hasMore
                      ? const Padding(
                          padding: EdgeInsets.all(16),
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : const SizedBox.shrink();
                }

                final reply = posts[replyIndex];
                return PostWidget(
                  key: ValueKey('reply_${reply.id}'),
                  post: reply,
                  revealMutedOrBlocked: widget.revealMutedOrBlocked,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/// スレッドの親。主役へ縦線を伸ばし、区切り線は引かない。
///
/// 親は伏せられていることがある (REQ-HIDE-007)。その場合は理由だけ出す。
class _ParentPost extends StatelessWidget {
  const _ParentPost({
    required this.parent,
    required this.revealMutedOrBlocked,
    required this.onRevealed,
  });

  final PostResult parent;
  final bool revealMutedOrBlocked;
  final ValueChanged<Post> onRevealed;

  @override
  Widget build(BuildContext context) {
    final metrics = PostMetrics.of(context);
    return switch (parent) {
      Post p => PostWidget(
        key: ValueKey('parent_${p.id}'),
        post: p,
        connectorBelow: true,
        showDivider: false,
        revealMutedOrBlocked: revealMutedOrBlocked,
      ),
      HiddenPost h => Padding(
        key: ValueKey('parent_hidden_${h.id}'),
        padding: EdgeInsets.fromLTRB(
          metrics.horizontalPadding,
          metrics.verticalPadding,
          metrics.horizontalPadding,
          0,
        ),
        child: HiddenPostCard(
          post: h,
          surface: HiddenPostSurface.post,
          onRevealed: onRevealed,
        ),
      ),
    };
  }
}

/// 返信できないときに入力欄の代わりに出す帯。
class _ReplyBlocked extends StatelessWidget {
  const _ReplyBlocked({required this.reason});

  final String reason;

  @override
  Widget build(BuildContext context) {
    final subColor = Theme.of(context).secondaryHeaderColor;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).dividerColor, width: 1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        spacing: 8,
        children: [
          Icon(Icons.lock_outline, size: 16, color: subColor),
          Expanded(
            child: Text(
              reason,
              style: TextStyle(fontSize: 13, color: subColor),
            ),
          ),
        ],
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
      await KarotterApi().posts.create(text, parentId: widget.postId);
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

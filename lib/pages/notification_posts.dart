import "package:flutter/material.dart" hide Notification;
import "package:karotator/api/karotter_api.dart";
import "package:karotator/objects/post.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/objects/notification.dart";
import "package:karotator/ui/post/post.dart";

class NotificationPostsPage extends StatefulWidget {
  const NotificationPostsPage({super.key, required this.notification});

  final Notification notification;

  @override
  State<NotificationPostsPage> createState() => _NotificationPostsPageState();
}

class _NotificationPostsPageState extends State<NotificationPostsPage> {
  late final Notification notification = widget.notification;

  late Future<void> initPostsData;

  late List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    initPostsData = fetchPosts();
  }

  Future<void> fetchPosts() async {
    try {
      final notificationPosts = await KarotterApi().notifications.groupedPosts(
        notification.notificationIds,
      );

      // 取り直した結果が非表示のことがある。完全なカロートとして扱わない
      // (REQ-HIDE-008)。Karotter Web も見えないものはキャッシュに入れない。
      List<Post> posts = [
        for (var post in notificationPosts)
          if (await KarotterApi().posts.byId(post.id) case final Post p) p,
      ];
      setState(() {
        this.posts = posts;
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
      appBar: AppBar(title: const Text("いいねされたカロート")),
      body: FutureBuilder(
        future: initPostsData,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.error != null) {
            return Center(child: Text('I got the error! ${snapshot.error}'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];

              return PostWidget(
                key: ValueKey('post_${post.id}_${posts.length}'),
                post: post,
              );
            },
          );
        },
      ),
    );
  }
}

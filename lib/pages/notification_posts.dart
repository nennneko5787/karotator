import "package:flutter/material.dart" hide Notification;
import "package:karotator/http.dart";
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
      final notificationPosts = await HTTPClient().getGroupedPosts(
        notification.notificationIds,
      );

      List<Post> posts = [
        for (var post in notificationPosts)
          await HTTPClient().getPostById(post.id),
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
              final isFirst = index == 0;
              final isLast = index == posts.length - 1;

              return PostWidget(
                key: ValueKey('post_${post.id}_${posts.length}'),
                post: post,
                isFirst: isFirst,
                isLast: isLast,
              );
            },
          );
        },
      ),
    );
  }
}

import "package:flutter/gestures.dart";
import "package:flutter/material.dart" hide Notification;
import "package:karotator/enum.dart";
import "package:karotator/http.dart";
import "package:karotator/objects/notification.dart";
import "package:karotator/pages/notification_posts.dart";
import "package:karotator/pages/post_detail.dart";
import "package:karotator/pages/profile.dart";
import "package:karotator/ui/dialog.dart";
import "package:karotator/utils.dart";

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationsPage> {
  late Future<void> initNotificationData;
  late ScrollController controller;

  List<Notification> notifications = [];
  int page = 1;
  bool isLoadingMore = false;
  bool hasMore = false;

  double fontSize = 12;

  @override
  void initState() {
    super.initState();

    controller = ScrollController()..addListener(onScroll);

    initNotificationData = refreshNotifications();
  }

  void onScroll() {
    if (!controller.hasClients || isLoadingMore || !hasMore) return;

    final threshold = 200.0; // 下から200pxで発火
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - threshold) {
      loadMore();
    }
  }

  Future<void> refreshNotifications() async {
    try {
      isLoadingMore = true;

      final response = await HTTPClient().getNotifications(
        page: page,
        limit: 15,
      );

      if (!response.pagination.hasMore) {
        await HTTPClient().markUnReadNotificationsAsRead();
      }

      setState(() {
        hasMore = response.pagination.hasMore;
        notifications.addAll(response.notifications as Iterable<Notification>);
      });

      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  Future<void> loadMore() async {
    try {
      isLoadingMore = true;
      page++;

      final response = await HTTPClient().getNotifications(
        page: page,
        limit: 15,
      );

      setState(() {
        hasMore = response.pagination.hasMore;
        notifications.addAll(response.notifications as Iterable<Notification>);
      });

      isLoadingMore = false;
    } catch (e, stackTrace) {
      debugPrint("$e\n$stackTrace");

      if (!mounted) return;
      showAlert(context, e: e);
    }
  }

  Widget buildNotificationTitle(Notification notification) {
    List<InlineSpan> spans = [];

    String? numOfPosts;
    if (notification.postCount > 1) {
      numOfPosts = "${notification.postCount}件の";
    }

    for (var entry in notification.actors.asMap().entries) {
      spans.add(
        TextSpan(
          text: entry.value.displayName,
          style: const TextStyle(fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfilePage(username: entry.value.username),
                ),
              );
            },
        ),
      );

      if (notification.actors.length > 1) {
        spans.add(
          TextSpan(
            text: entry.key < notification.actors.length - 1 ? "さん、" : "さん",
          ),
        );
      }
    }

    switch (notification.type) {
      case NotificationType.LIKE:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートをいいねしました"));
        break;
      case NotificationType.REPLY:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートに返信しました"));
        break;
      case NotificationType.REKAROT:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートをリカロートしました"));
        break;
      case NotificationType.QUOTE:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートを引用しました"));
        break;
      case NotificationType.FOLLOW:
        spans.add(const TextSpan(text: "にフォローされています"));
        break;
      case NotificationType.REACTION:
        spans.add(TextSpan(text: "が${numOfPosts ?? ""}あなたのカロートにリアクションしました"));
        break;
    }

    return Text.rich(TextSpan(children: spans));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initNotificationData,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.error != null) {
          return Center(child: Text('I got the error! ${snapshot.error}'));
        }

        return RefreshIndicator(
          onRefresh: refreshNotifications,
          child: ListView.builder(
            controller: controller,
            padding: const EdgeInsets.all(8),
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: notifications.length + 1,
            itemBuilder: (context, index) {
              if (index == notifications.length) {
                return hasMore
                    ? const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : const SizedBox.shrink();
              }

              final notification = notifications[index];
              final isLast = index == notifications.length - 1;

              return Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(
                              username: notification.actor.username,
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage:
                                  (notification.actor.avatarUrl == null)
                                  ? AssetImage(
                                      "assets/images/default-avatar.png",
                                    )
                                  : NetworkImage(
                                      "https://karotter.com${notification.actor.avatarUrl!}",
                                    ),
                            ),
                            Positioned(
                              right: -4,
                              bottom: -4,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 1.5,
                                  ),
                                ),
                                child: Icon(
                                  switch (notification.type) {
                                    NotificationType.LIKE => Icons.favorite,
                                    NotificationType.REPLY => Icons.comment,
                                    NotificationType.REKAROT => Icons.repeat,
                                    NotificationType.QUOTE =>
                                      Icons.format_quote,
                                    NotificationType.FOLLOW => Icons.person_add,
                                    _ => Icons.auto_awesome,
                                  },
                                  color: switch (notification.type) {
                                    NotificationType.LIKE => Colors.red,
                                    NotificationType.REPLY => Colors.blue,
                                    NotificationType.REKAROT => Colors.green,
                                    NotificationType.QUOTE => Colors.lightGreen,
                                    NotificationType.FOLLOW => Colors.blue,
                                    _ => Colors.orange,
                                  },
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    title: GestureDetector(
                      onTap: () async {
                        if (notification.type != NotificationType.FOLLOW) {
                          if (notification.postCount <= 1) {
                            final post = await HTTPClient().getPostById(
                              notification.post!.id,
                            );

                            if (!context.mounted) return;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    PostDetailPage(post: post),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationPostsPage(
                                  notification: notification,
                                ),
                              ),
                            );
                          }
                        }
                      },
                      child: buildNotificationTitle(notification),
                    ),
                    subtitle: (notification.post == null)
                        ? null
                        : GestureDetector(
                            onTap: () async {
                              if (notification.postCount <= 1) {
                                final post = await HTTPClient().getPostById(
                                  notification.post!.id,
                                );

                                if (!context.mounted) return;
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PostDetailPage(post: post),
                                  ),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => NotificationPostsPage(
                                      notification: notification,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Text(
                              notification.post!.content,
                              style: TextStyle(fontSize: fontSize - 1),
                            ),
                          ),
                    trailing: Text(
                      getLocalizedDateTime(notification.createdAt),
                      style: TextStyle(fontSize: fontSize - 2),
                    ),
                  ),
                  if (!isLast) const Divider(height: 1),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
